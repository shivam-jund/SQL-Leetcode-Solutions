select s.user_id, coalesce(round(sum(case when c.action = 'confirmed' then 1 else null end )::numeric/count(action),2),0) as confirmation_rate 
from Signups s
left join Confirmations c on s.user_id = c.user_id
group by s.user_id;