SHOW INDEX FROM student_sleep_mental_health_2026;

-- Examine query execution plan before adding an index
EXPLAIN
SELECT student_id, avg_sleep_hours
FROM student_sleep_mental_health_2026
WHERE avg_sleep_hours < 6;

-- Create a secondary index.
-- Run only once; check SHOW INDEX first.
CREATE INDEX idx_sleep_hours
ON student_sleep_mental_health_2026 (avg_sleep_hours);

-- Examine the execution plan after adding the index
EXPLAIN
SELECT student_id, avg_sleep_hours
FROM student_sleep_mental_health_2026
WHERE avg_sleep_hours < 6;

-- Optional composite index for combined filters:
-- CREATE INDEX idx_burnout_sleep
-- ON student_sleep_mental_health_2026
-- (feels_burned_out, avg_sleep_hours);

-- To remove the demonstration index:
-- DROP INDEX idx_sleep_hours
-- ON student_sleep_mental_health_2026;