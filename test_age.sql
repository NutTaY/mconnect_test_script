SELECT
    age,
    count(*)
FROM
    ohc_surveys
GROUP BY
    age;