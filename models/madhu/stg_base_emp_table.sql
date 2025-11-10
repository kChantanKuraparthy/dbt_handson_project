{{ config(materialized='table') }}

    -- Step 1: Pull data from Snowflake raw table
    SELECT * 
    FROM {{ source('dbt_model_source1', 'emp') }}

