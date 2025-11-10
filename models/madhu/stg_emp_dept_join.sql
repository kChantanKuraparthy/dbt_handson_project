{{ config(materialized="view") }}


select e.*, {{ sum_two_columns("sal", "comm") }} as total_compensation
from {{ ref("stg_base_emp") }} e
join {{ ref("stg_base_dept") }} d on e.deptno = d.deptno
