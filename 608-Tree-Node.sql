-- Write your PostgreSQL query statement below
select distinct t1.id, case 
                when t1.p_id is null then 'Root' 
                when t2.id is not null then 'Inner'
                else 'Leaf'
                end as type
from tree t1
left join tree t2 on  t2.p_id = t1.id;