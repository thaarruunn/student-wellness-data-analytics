CREATE OR REPLACE VIEW student_wellness_view AS
SELECT
    student_id,
    age,
    gender,
    education_level,
    avg_sleep_hours,
    screen_time_hours,
    social_media_hours,
    study_hours_per_day,
    exercise_hours_per_week,
    caffeine_drinks_per_day,
    stress_level,
    anxiety_score,
    gpa,
    uses_sleep_app,
    feels_burned_out
FROM student_sleep_mental_health_2026;


-- Summary view grouped by burnout response
CREATE OR REPLACE VIEW burnout_summary_view AS
SELECT
    feels_burned_out,
    COUNT(*) AS student_count,
    ROUND(
        100.0 * COUNT(*) /
        (SELECT COUNT(*) FROM student_sleep_mental_health_2026),
        2
    ) AS percentage_of_students,
    ROUND(AVG(avg_sleep_hours), 2) AS average_sleep_hours,
    ROUND(AVG(screen_time_hours), 2) AS average_screen_time_hours,
    ROUND(AVG(stress_level), 2) AS average_stress_level,
    ROUND(AVG(anxiety_score), 2) AS average_anxiety_score,
    ROUND(AVG(gpa), 2) AS average_gpa
FROM student_sleep_mental_health_2026
GROUP BY feels_burned_out;


-- Test the views
SELECT *
FROM student_wellness_view
LIMIT 10;

SELECT *
FROM burnout_summary_view;