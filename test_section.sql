SELECT
    section,
    count(*)
FROM
    ohc_surveys
GROUP BY
    section;