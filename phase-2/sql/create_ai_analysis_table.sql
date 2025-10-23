-- Create table for AI-generated error analysis
CREATE TABLE IF NOT EXISTS `pipeline-guardian.pipeline_guardian_data.ai_analysis` (
  analysis_time TIMESTAMP,
  error_message STRING,
  query_executed STRING,
  ai_explanation STRING,
  suggested_fix STRING
)
PARTITION BY DATE(analysis_time)
OPTIONS(
  description="AI-powered error analysis from Gemini (Phase 2)",
  partition_expiration_days=90
);
