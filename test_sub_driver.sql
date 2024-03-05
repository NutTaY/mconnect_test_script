SELECT
    question_no,
    SUM(
        CASE
            WHEN answer IN (1, 2) THEN percent
            ELSE 0
        END
    ) AS good_percent,
    SUM(
        CASE
            WHEN answer IN (3, 4) THEN percent
            ELSE 0
        END
    ) AS warn_percent,
    SUM(
        CASE
            WHEN answer IN (5, 6) THEN percent
            ELSE 0
        END
    ) AS defect_percent
FROM
    (
        SELECT
            ohc_survey_answers.question_no,
            answer,
            COUNT(*) AS count,
            COUNT(*) / total.total_count * 100 AS percent
        FROM
            ohc_survey_answers
            CROSS JOIN (
                SELECT
                    question_no,
                    COUNT(*) AS total_count
                FROM
                    ohc_survey_answers
                WHERE
                    answer != 0
                    AND survey_id != 42
                GROUP BY
                    question_no
            ) AS total ON ohc_survey_answers.question_no = total.question_no
        WHERE
            answer != 0
            AND survey_id != 42
        GROUP BY
            ohc_survey_answers.question_no,
            answer
    ) AS subquery
GROUP BY
    question_no;