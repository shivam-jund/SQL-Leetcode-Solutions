CREATE OR REPLACE FUNCTION NthHighestSalary(N INT) RETURNS TABLE (Salary INT) AS $$
BEGIN
  RETURN QUERY select (
    select temp.salary 
    from (
        select e.salary, dense_rank() over (order by e.salary desc) as r
        from employee e
    ) as temp
    where temp.r = n
    limit 1
  ) as salary;
END;
$$ LANGUAGE plpgsql;