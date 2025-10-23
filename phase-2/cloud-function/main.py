from google import genai
from google.cloud import bigquery
import base64
import json
import os
from datetime import datetime

def analyze_error(event, context):
    """Triggered by Pub/Sub when new log arrives"""
    
    # Decode Pub/Sub message
    pubsub_message = base64.b64decode(event['data']).decode('utf-8')
    log_data = json.loads(pubsub_message)
    
    # Extract job status
    # Extract protoPayload
    proto = log_data.get('protoPayload', {})

	# CHECK 1: Top-level status error (scheduled query validation failures)
    top_status = proto.get('status', {})
    top_error_code = top_status.get('code', 0)
    top_error_message = top_status.get('message', '')

	# CHECK 2: Job status error (manual query execution failures)
    service_data = proto.get('serviceData', {})
    job_insert_response = service_data.get('jobInsertResponse', {})
    resource = job_insert_response.get('resource', {})
    job_status = resource.get('jobStatus', {})
    job_error = job_status.get('error', {})

	# Determine which error type we have
    if top_error_code and top_error_code != 0:
		# Scheduled query validation error
        error_message = top_error_message
        error_code = top_error_code
        error_type = "Scheduled Query Validation"
    elif job_error and job_status.get('state') == 'DONE':
		# Manual query execution error
        error_message = job_error.get('message', 'Unknown error')
        error_code = job_error.get('code', 'Unknown')
        error_type = "Query Execution"
    else:
		# No error or not relevant
        print('No error found, skipping')
        return 'No error, skipping'

    print(f'Processing {error_type} error: {error_message[:50]}...')
    
    # Extract query
    job_insert_request = service_data.get('jobInsertRequest', {})
    request_resource = job_insert_request.get('resource', {})
    job_config = request_resource.get('jobConfiguration', {})
    query_config = job_config.get('query', {})
    query_executed = query_config.get('query', 'Query not available')
    
    print(f'Processing error: {error_message[:50]}...')
    
    # Configure Gemini - FIX IS HERE
    api_key = os.environ.get('GEMINI_API_KEY')
    if not api_key:
        print('ERROR: GEMINI_API_KEY not set!')
        return 'API key missing'
    
   
    # 1. Initialize the client with the API key
    client = genai.Client(api_key=api_key)
       

    # Create prompt
    prompt = f"""You are a BigQuery expert.

ERROR CODE: {error_code}
ERROR MESSAGE: {error_message}
QUERY EXECUTED: {query_executed}

Provide:
1. Root cause (1-2 sentences)
2. Fixed query (if applicable, provide working SQL)
3. Prevention tip (how to avoid this)

Be concise and actionable."""
    
    # Get AI analysis
    try:
        # Use the generate_content method on the model object
        response = client.models.generate_content(model="gemini-2.0-flash-exp", contents= prompt)
        ai_explanation = response.text
    except Exception as e:
        print(f'Gemini API error: {str(e)}')
        ai_explanation = f'AI analysis failed: {str(e)}'
    
    # Save to BigQuery
    try:
        bq = bigquery.Client()
        table_id = "pipeline-guardian.pipeline_guardian_data.ai_analysis"
        row = {
            "analysis_time": datetime.utcnow().isoformat(),
            "error_message": error_message,
            "query_executed": query_executed[:10000],  # Limit length
            "ai_explanation": ai_explanation[:10000],
            "suggested_fix": "See AI explanation"
        }
        
        errors = bq.insert_rows_json(table_id, [row])
        if errors:
            print(f'BigQuery insert error: {errors}')
            return f'BQ error: {errors}'
        
        print(f'✅ AI analysis saved for: {error_message[:50]}')
        return f'Analyzed: {error_message[:50]}'
        
    except Exception as e:
        print(f'BigQuery error: {str(e)}')
        return f'BQ error: {str(e)}'
