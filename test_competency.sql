SELECT
  question_no,
  COUNT(*) AS total_responses,
  COUNT(CASE WHEN answer = '0' THEN 1 END) AS answer_0_count,
  COUNT(CASE WHEN answer = '1' THEN 1 END) AS answer_1_count,
  COUNT(CASE WHEN answer = '2' THEN 1 END) AS answer_2_count,
  COUNT(CASE WHEN answer = '3' THEN 1 END) AS answer_3_count,
  COUNT(CASE WHEN answer = '4' THEN 1 END) AS answer_4_count,
  COUNT(CASE WHEN answer = '5' THEN 1 END) AS answer_5_count,
  COUNT(CASE WHEN answer = '6' THEN 1 END) AS answer_6_count,
  (COUNT(CASE WHEN answer = '1' THEN 1 END) * 1.0 / (COUNT(*) - COUNT(CASE WHEN answer = '0' THEN 1 END))) * 100 AS percentage_1,
  (COUNT(CASE WHEN answer = '2' THEN 1 END) * 1.0 / (COUNT(*) - COUNT(CASE WHEN answer = '0' THEN 1 END))) * 100 AS percentage_2,
  (COUNT(CASE WHEN answer = '3' THEN 1 END) * 1.0 / (COUNT(*) - COUNT(CASE WHEN answer = '0' THEN 1 END))) * 100 AS percentage_3,
  (COUNT(CASE WHEN answer = '4' THEN 1 END) * 1.0 / (COUNT(*) - COUNT(CASE WHEN answer = '0' THEN 1 END))) * 100 AS percentage_4,
  (COUNT(CASE WHEN answer = '5' THEN 1 END) * 1.0 / (COUNT(*) - COUNT(CASE WHEN answer = '0' THEN 1 END))) * 100 AS percentage_5,
  (COUNT(CASE WHEN answer = '6' THEN 1 END) * 1.0 / (COUNT(*) - COUNT(CASE WHEN answer = '0' THEN 1 END))) * 100 AS percentage_6
FROM `ohc_survey_answers`
WHERE question_no BETWEEN 31 AND 36
GROUP BY question_no
ORDER BY question_no;