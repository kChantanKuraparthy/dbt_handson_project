{{ config(materialized='table') }}

    select 
       {{ dbt_utils.generate_surrogate_key(['empno', 'deptno']) }} as emp_sk,
       ,md5(
        concat_ws(
            '||',         -- delimiter to separate columns
            cast(empno as string),
            cast(deptno as string)
        )
    ) as emp_sk2,
        *
 from {{source('dbt_model_source1','emp') }}

