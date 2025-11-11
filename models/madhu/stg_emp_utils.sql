{{ config(materialized='table') }}

    select 
       {{ dbt_utils.generate_surrogate_key(['empno', 'deptno']) }} as emp_sk,
        *
 from {{source('dbt_model_source1','emp') }}
