-- Sample Queries for Pipeline Guardian
-- These queries demonstrate log analysis capabilities

-- 1. View recent pipeline executions
SELECT 
  JSON_VALUE(data, '$.timestamp') as log_timestamp,
  JSON_VALUE(data, '$.protoPayload.methodName') as method,
  JSON_VALUE(data, '$.protoPayload.serviceData.jobInsertRequest.resource.jobName.jobId') as job_id,
  JSON_VALUE(data, '$.protoPayload.serviceData.jobInsertRequest.resource.jobStatus.state') as job_state
FROM pipeline_guardian_data.pipeline_logs
ORDER BY log_timestamp DESC
LIMIT 20;

-- 2. Count logs by severity
SELECT 
  JSON_VALUE(data, '$.severity') as severity,
  COUNT(*) as count
FROM pipeline_guardian_data.pipeline_logs
GROUP BY severity
ORDER BY count DESC;

-- 3. Extract job statistics
SELECT 
  JSON_VALUE(data, '$.timestamp') as timestamp,
  JSON_VALUE(data, '$.protoPayload.serviceData.jobStatistics.totalSlotMs') as total_slots,
  JSON_VALUE(data, '$.protoPayload.serviceData.jobStatistics.totalBilledBytes') as billed_bytes
FROM pipeline_guardian_data.pipeline_logs
WHERE JSON_VALUE(data, '$.protoPayload.methodName') = 'jobservice.insert'
ORDER BY timestamp DESC
LIMIT 10;

-- 4. Check for errors
SELECT 
  JSON_VALUE(data, '$.timestamp') as timestamp,
  JSON_VALUE(data, '$.severity') as severity,
  JSON_VALUE(data, '$.protoPayload.status.message') as error_message
FROM pipeline_guardian_data.pipeline_logs
WHERE JSON_VALUE(data, '$.severity') IN ('ERROR', 'WARNING')
ORDER BY timestamp DESC;

