SELECT
  SUM(CASE WHEN answer IN ('5', '6') THEN 1 ELSE 0 END) AS answers_5_and_6_count,
  COUNT(*) - COUNT(CASE WHEN answer = '0' THEN 1 END) AS total_responses_excluding_0,
  (SUM(CASE WHEN answer IN ('5', '6') THEN 1 ELSE 0 END) * 1.0 / (COUNT(*) - COUNT(CASE WHEN answer = '0' THEN 1 END))) * 100 AS percentage_5_and_6
FROM `ohc_survey_answers`
WHERE question_no BETWEEN 1 AND 6;