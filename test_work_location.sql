SELECT
    work_location,
    count(*)
FROM
    ohc_surveys
GROUP BY
    work_location;