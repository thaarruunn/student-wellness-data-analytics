USE student_wellness;

SHOW TABLES;

DESCRIBE student_sleep_mental_health_2026;

SHOW CREATE TABLE student_sleep_mental_health_2026;

SELECT COUNT(*) AS total_records
FROM student_sleep_mental_health_2026;

SELECT COUNT(DISTINCT student_id) AS distinct_student_ids
FROM student_sleep_mental_health_2026;