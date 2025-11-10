{{ config(materialized='view') }}

    
    SELECT e.* 
    FROM {{ ref('stg_base_emp_table') }} e 
     join {{ ref('stg_base_dept_table') }} d 
        on e.DEPTNO=d.DEPTNO

