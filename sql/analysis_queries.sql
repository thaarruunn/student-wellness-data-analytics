USE student_wellness;

-- Q1. Preview records
SELECT *
FROM student_sleep_mental_health_2026
LIMIT 10;

-- Q2. Total records and distinct IDs
SELECT COUNT(*) AS total_records,
       COUNT(DISTINCT student_id) AS distinct_student_ids
FROM student_sleep_mental_health_2026;

-- Q3. Overall averages
SELECT AVG(avg_sleep_hours) AS average_sleep_hours,
       AVG(screen_time_hours) AS average_screen_time_hours,
       AVG(study_hours_per_day) AS average_study_hours,
       AVG(exercise_hours_per_week) AS average_exercise_hours,
       AVG(stress_level) AS average_stress_level,
       AVG(anxiety_score) AS average_anxiety_score,
       AVG(gpa) AS average_gpa
FROM student_sleep_mental_health_2026;

-- Q4. Student count by gender
SELECT gender, COUNT(*) AS student_count
FROM student_sleep_mental_health_2026
GROUP BY gender
ORDER BY student_count DESC;

-- Q5. Student count by education level
SELECT education_level, COUNT(*) AS student_count
FROM student_sleep_mental_health_2026
GROUP BY education_level
ORDER BY student_count DESC;

-- Q6. Compare students by burnout response
SELECT feels_burned_out,
       COUNT(*) AS student_count,
       AVG(avg_sleep_hours) AS average_sleep,
       AVG(screen_time_hours) AS average_screen_time,
       AVG(stress_level) AS average_stress,
       AVG(anxiety_score) AS average_anxiety,
       AVG(gpa) AS average_gpa
FROM student_sleep_mental_health_2026
GROUP BY feels_burned_out;

-- Q7. Students with high screen time (8+ hours)
SELECT student_id, screen_time_hours,
       avg_sleep_hours, stress_level, anxiety_score, gpa
FROM student_sleep_mental_health_2026
WHERE screen_time_hours >= 8
ORDER BY screen_time_hours DESC;

-- Q8. Students sleeping under 6 hours
SELECT student_id, avg_sleep_hours,
       screen_time_hours, stress_level, anxiety_score
FROM student_sleep_mental_health_2026
WHERE avg_sleep_hours < 6
ORDER BY avg_sleep_hours ASC;

-- Q9. Average sleep by screen-time group
SELECT
    CASE
        WHEN screen_time_hours < 4 THEN 'Under 4 hours'
        WHEN screen_time_hours < 8 THEN '4 to under 8 hours'
        ELSE '8+ hours'
    END AS screen_time_group,
    COUNT(*) AS student_count,
    AVG(avg_sleep_hours) AS average_sleep_hours
FROM student_sleep_mental_health_2026
WHERE screen_time_hours IS NOT NULL
GROUP BY screen_time_group;

-- Q10. Sleep-duration distribution
SELECT
    CASE
        WHEN avg_sleep_hours < 6 THEN 'Under 6 hours'
        WHEN avg_sleep_hours < 8 THEN '6 to under 8 hours'
        ELSE '8+ hours'
    END AS sleep_category,
    COUNT(*) AS student_count
FROM student_sleep_mental_health_2026
WHERE avg_sleep_hours IS NOT NULL
GROUP BY sleep_category;

-- Q11. Average GPA by sleep group
SELECT
    CASE
        WHEN avg_sleep_hours < 6 THEN 'Under 6 hours'
        WHEN avg_sleep_hours < 8 THEN '6 to under 8 hours'
        ELSE '8+ hours'
    END AS sleep_category,
    COUNT(*) AS student_count,
    AVG(gpa) AS average_gpa
FROM student_sleep_mental_health_2026
WHERE avg_sleep_hours IS NOT NULL
GROUP BY sleep_category;

-- Q12. Compare sleep-app users and non-users
SELECT uses_sleep_app,
       COUNT(*) AS student_count,
       AVG(avg_sleep_hours) AS average_sleep,
       AVG(stress_level) AS average_stress,
       AVG(anxiety_score) AS average_anxiety,
       AVG(gpa) AS average_gpa
FROM student_sleep_mental_health_2026
GROUP BY uses_sleep_app;

-- Q13. Caffeine consumption and well-being
SELECT caffeine_drinks_per_day,
       COUNT(*) AS student_count,
       AVG(avg_sleep_hours) AS average_sleep,
       AVG(exercise_hours_per_week) AS average_exercise,
       AVG(stress_level) AS average_stress
FROM student_sleep_mental_health_2026
GROUP BY caffeine_drinks_per_day
ORDER BY caffeine_drinks_per_day;

-- Q14. Average GPA by study-time group
SELECT
    CASE
        WHEN study_hours_per_day < 2 THEN 'Under 2 hours'
        WHEN study_hours_per_day < 4 THEN '2 to under 4 hours'
        ELSE '4+ hours'
    END AS study_group,
    COUNT(*) AS student_count,
    AVG(gpa) AS average_gpa
FROM student_sleep_mental_health_2026
WHERE study_hours_per_day IS NOT NULL
GROUP BY study_group;

-- Q15. Check missing values
SELECT
    SUM(student_id IS NULL) AS missing_student_id,
    SUM(avg_sleep_hours IS NULL) AS missing_sleep,
    SUM(screen_time_hours IS NULL) AS missing_screen_time,
    SUM(stress_level IS NULL) AS missing_stress,
    SUM(anxiety_score IS NULL) AS missing_anxiety,
    SUM(gpa IS NULL) AS missing_gpa
FROM student_sleep_mental_health_2026;