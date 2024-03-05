SELECT
    division,
    count(*)
FROM
    ohc_surveys
GROUP BY
    division;