-- Write your PostgreSQL query statement below
select max(t.num) as num
from (
    select t1.num 
    from MyNumbers t1
    group by t1.num 
    having count(*) = 1
    
) as t;