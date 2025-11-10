{{ config
(
    materialized='table'
    ) 
}}

WITH source AS (
    -- Step 1: Pull data from Snowflake raw table
    SELECT * 
    FROM {{ source('dbt_model_source1', 'emp') }}
),

cleaned AS (
    -- Step 2: Clean and standardize data
    SELECT 
        EMPNO AS emp_id,
        INITCAP(TRIM(ENAME)) AS emp_name,
        UPPER(TRIM(JOB)) AS job_title,
        MGR AS manager_id,
        HIREDATE AS hire_date,
        ROUND(SAL, 2) AS salary,
        COALESCE(COMM, 0) AS commission,
        DEPTNO AS dept_id,
        CURRENT_TIMESTAMP() AS load_ts
    FROM source
    WHERE EMPNO IS NOT NULL
)

-- Step 3: Final select
SELECT * FROM cleaned;
