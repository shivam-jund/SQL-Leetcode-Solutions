with cte1 as (
    select id, departmentId, name, salary, dense_rank() over (
        partition by departmentId
        order by salary desc
    ) as dr
    from employee
) 
select d.name as Department, c1.name as Employee, c1.salary as Salary
from cte1 c1
join department d on d.id = c1.departmentId
where dr <=3;