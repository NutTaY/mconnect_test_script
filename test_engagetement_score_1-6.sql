SELECT
  question_no,
  SUM(CASE WHEN answer IN ('1', '2') THEN 1 ELSE 0 END) AS answers_1_and_2_count,
  SUM(CASE WHEN answer IN ('3', '4') THEN 1 ELSE 0 END) AS answers_3_and_4_count,
  SUM(CASE WHEN answer IN ('5', '6') THEN 1 ELSE 0 END) AS answers_5_and_6_count,
  COUNT(*) - COUNT(CASE WHEN answer = '0' THEN 1 END) AS total_responses_excluding_0,
  (SUM(CASE WHEN answer IN ('1', '2') THEN 1 ELSE 0 END) / (COUNT(*) * 1.0 - COUNT(CASE WHEN answer = '0' THEN 1 END))) * 100 AS percentage_1_and_2,
  (SUM(CASE WHEN answer IN ('3', '4') THEN 1 ELSE 0 END) / (COUNT(*) * 1.0 - COUNT(CASE WHEN answer = '0' THEN 1 END))) * 100 AS percentage_3_and_4,
  (SUM(CASE WHEN answer IN ('5', '6') THEN 1 ELSE 0 END) / (COUNT(*) * 1.0 - COUNT(CASE WHEN answer = '0' THEN 1 END))) * 100 AS percentage_5_and_6
FROM `ohc_survey_answers`
WHERE question_no BETWEEN 1 AND 6
GROUP BY question_no
ORDER BY question_no;