-- Write your PostgreSQL query statement below
(
    SELECT
        u.name AS results
    FROM MovieRating mr
    JOIN Users u
        USING (user_id)
    GROUP BY u.name
    ORDER BY COUNT(*) DESC, u.name
    LIMIT 1
)

UNION ALL

(
    SELECT
        m.title AS results
    FROM MovieRating mr
    JOIN Movies m
        USING (movie_id)
    WHERE mr.created_at BETWEEN '2020-02-01' AND '2020-02-29'
    GROUP BY m.title
    ORDER BY AVG(mr.rating) DESC, m.title
    LIMIT 1
);