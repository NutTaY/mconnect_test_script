SELECT
    education_level,
    count(*)
FROM
    ohc_surveys
GROUP BY
    education_level;