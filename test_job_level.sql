SELECT
    job_level,
    count(*)
FROM
    ohc_surveys
GROUP BY
    job_level;