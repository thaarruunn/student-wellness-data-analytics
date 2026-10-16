ALTER TABLE student_sleep_mental_health_2026
ADD CONSTRAINT chk_age_range
CHECK (age BETWEEN 0 AND 120);

ALTER TABLE student_sleep_mental_health_2026
ADD CONSTRAINT chk_sleep_range
CHECK (avg_sleep_hours BETWEEN 0 AND 24);

ALTER TABLE student_sleep_mental_health_2026
ADD CONSTRAINT chk_screen_time_range
CHECK (screen_time_hours BETWEEN 0 AND 24);

ALTER TABLE student_sleep_mental_health_2026
ADD CONSTRAINT chk_gpa_range
CHECK (gpa BETWEEN 0 AND 10);

-- Verify the table definition
SHOW CREATE TABLE student_sleep_mental_health_2026;