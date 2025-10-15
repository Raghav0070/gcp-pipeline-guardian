```sql
-- Create sample events table for simulated pipeline
-- This generates 100 rows of random event data

CREATE OR REPLACE TABLE pipeline_guardian_data.sample_events AS
SELECT 
  GENERATE_UUID() as event_id,
  CURRENT_TIMESTAMP() as event_time,
  ["user_login", "page_view", "purchase", "logout"]
    [OFFSET(CAST(FLOOR(RAND() * 4) AS INT64))] as event_type,
  CAST(RAND() * 1000 AS INT64) as user_id,
  CAST(RAND() * 100 AS INT64) as value
FROM 
  UNNEST(GENERATE_ARRAY(1, 100)) as num;
