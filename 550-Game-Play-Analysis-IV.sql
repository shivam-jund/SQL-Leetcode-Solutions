select
    round(
        (   
            select 1.0*count(*)
            from (SELECT player_id, MIN(event_date) AS first_login
            FROM Activity
            GROUP BY player_id) as a1
            join activity a2 on 
            a1.first_login + INTERVAL '1 day'  = a2.event_date 
            and 
            a1.player_id = a2.player_id
        )
        / 
        (
            select count(distinct player_id) 
            from activity a3
        ),
        2
    ) as fraction;
