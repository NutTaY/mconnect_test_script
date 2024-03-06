WITH grouped_responses AS (
  SELECT
    CASE
      WHEN question_no IN (1, 2) THEN '1_2'
      WHEN question_no IN (3, 4) THEN '3_4'
      WHEN question_no IN (5, 6) THEN '5_6'
    END AS question_group,
    SUM(CASE WHEN answer IN ('1', '2') THEN 1 ELSE 0 END) AS answers_1_and_2_count,
    SUM(CASE WHEN answer IN ('3', '4') THEN 1 ELSE 0 END) AS answers_3_and_4_count,
    SUM(CASE WHEN answer IN ('5', '6') THEN 1 ELSE 0 END) AS answers_5_and_6_count,
    COUNT(*) - COUNT(CASE WHEN answer = '0' THEN 1 END) AS total_responses_excluding_0
  FROM `ohc_survey_answers`
  WHERE question_no BETWEEN 1 AND 6
  GROUP BY
    CASE
      WHEN question_no IN (1, 2) THEN '1_2'
      WHEN question_no IN (3, 4) THEN '3_4'
      WHEN question_no IN (5, 6) THEN '5_6'
    END
)
SELECT
  question_group,
  SUM(answers_1_and_2_count) AS total_answers_1_and_2,
  SUM(answers_3_and_4_count) AS total_answers_3_and_4,
  SUM(answers_5_and_6_count) AS total_answers_5_and_6,
  SUM(total_responses_excluding_0) AS total_responses_excluding_0,
  (SUM(answers_1_and_2_count) / SUM(total_responses_excluding_0) * 100) AS percentage_1_and_2,
  (SUM(answers_3_and_4_count) / SUM(total_responses_excluding_0) * 100) AS percentage_3_and_4,
  (SUM(answers_5_and_6_count) / SUM(total_responses_excluding_0) * 100) AS percentage_5_and_6
FROM grouped_responses
GROUP BY question_group
ORDER BY question_group;