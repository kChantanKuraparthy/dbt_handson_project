 - name: stg_emp
    description: "Cleaned and standardized employee data from the raw EMP table"
    columns:
      - name: emp_id
        description: "Unique Employee ID"
        tests:
          - not_null
          - unique
      - name: dept_id
        description: "Department number"
      - name: salary
        description: "Employee salary rounded to 2 decimals"
