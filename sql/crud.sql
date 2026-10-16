SELECT student_id
FROM student_sleep_mental_health_2026
WHERE student_id BETWEEN 90001 AND 90005;

-- CREATE: Insert five temporary demonstration records
INSERT INTO student_sleep_mental_health_2026
(
    student_id, age, gender, education_level,
    avg_sleep_hours, screen_time_hours, social_media_hours,
    study_hours_per_day, exercise_hours_per_week,
    caffeine_drinks_per_day, stress_level, anxiety_score,
    gpa, uses_sleep_app, feels_burned_out
)
VALUES
(90001, 19, 'Female', 'UG', 7.0, 5.0, 2.0, 3.0, 4.0, 1, 2, 3, 8.0, 'Yes', 'No'),
(90002, 20, 'Male', 'UG', 6.0, 8.0, 3.0, 2.0, 2.0, 2, 4, 4, 7.0, 'No', 'Yes'),
(90003, 18, 'Female', 'UG', 8.0, 4.0, 1.0, 4.0, 5.0, 0, 1, 2, 9.0, 'Yes', 'No'),
(90004, 21, 'Male', 'PG', 5.5, 9.0, 4.0, 1.5, 1.0, 3, 5, 5, 6.5, 'No', 'Yes'),
(90005, 19, 'Other', 'UG', 7.5, 6.0, 2.5, 3.5, 3.0, 1, 3, 3, 8.2, 'No', 'No');

-- READ
SELECT *
FROM student_sleep_mental_health_2026
WHERE student_id BETWEEN 90001 AND 90005
ORDER BY student_id;

-- UPDATE
UPDATE student_sleep_mental_health_2026
SET gpa = 8.5
WHERE student_id = 90001;

SELECT student_id, gpa
FROM student_sleep_mental_health_2026
WHERE student_id = 90001;

-- DELETE: Remove only the temporary records
DELETE FROM student_sleep_mental_health_2026
WHERE student_id BETWEEN 90001 AND 90005;

-- Verify cleanup
SELECT COUNT(*) AS remaining_demo_rows
FROM student_sleep_mental_health_2026
WHERE student_id BETWEEN 90001 AND 90005;