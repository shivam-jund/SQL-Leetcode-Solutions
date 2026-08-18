select distinct u.user_id as buyer_id, u.join_date, 
sum(case 
        when date_part('year', o.order_date) = '2019' then 1 else 0
    end
    ) 
over(partition by u.user_id) as orders_in_2019
from users u
left join orders o on u.user_id = o.buyer_id;

