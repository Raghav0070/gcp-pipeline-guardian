-- Sample queries to test error detection

-- 1. Table not found
SELECT * FROM pipeline_guardian_data.table_does_not_exist;

-- 2. Dataset not found
SELECT * FROM `dataset_does_not_exist.any_table`;

-- 3. Syntax error
SELECT * FORM pipeline_guardian_data.ai_analysis;

-- 4. Column not found
SELECT non_existent_column FROM pipeline_guardian_data.ai_analysis;

-- 5. Garbage 
SELECT `KOILA`
