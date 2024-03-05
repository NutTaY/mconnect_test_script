SELECT
    department,
    count(*)
FROM
    ohc_surveys
GROUP BY
    department;