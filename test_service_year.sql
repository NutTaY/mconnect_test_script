SELECT
    service_year,
    count(*)
FROM
    ohc_surveys
GROUP BY
    service_year;