-- View recent AI analysis
SELECT 
  analysis_time,
  error_message,
  LEFT(query_executed, 100) as query_preview,
  ai_explanation
FROM pipeline_guardian_data.ai_analysis
ORDER BY analysis_time DESC
LIMIT 5;
