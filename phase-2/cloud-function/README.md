# Cloud Function: analyze-error

## Overview
Serverless function that analyzes BigQuery errors using Gemini AI.

## Deployment

```bash
export GEMINI_API_KEY="your-key-here"

gcloud functions deploy analyze-error \
  --runtime python311 \
  --trigger-topic pipeline-logs \
  --entry-point analyze_error \
  --set-env-vars GEMINI_API_KEY=$GEMINI_API_KEY \
  --region us-central1 \
  --memory 256MB \
  --timeout 60s
