DELIMITER //

CREATE PROCEDURE GetHighScreenTimeStudents()
BEGIN
    SELECT student_id,
           screen_time_hours,
           avg_sleep_hours,
           stress_level,
           gpa
    FROM student_sleep_mental_health_2026
    WHERE screen_time_hours >= 8
    ORDER BY screen_time_hours DESC;
END //

DELIMITER ;

-- Execute the stored procedure
CALL GetHighScreenTimeStudents();


-- Stored function
DROP FUNCTION IF EXISTS GetAverageSleepHours;

DELIMITER //

CREATE FUNCTION GetAverageSleepHours()
RETURNS DECIMAL(5,2)
READS SQL DATA
BEGIN
    DECLARE avg_sleep DECIMAL(5,2);

    SELECT AVG(avg_sleep_hours)
    INTO avg_sleep
    FROM student_sleep_mental_health_2026;

    RETURN avg_sleep;
END //

DELIMITER ;

-- Execute the stored function
SELECT GetAverageSleepHours() AS average_sleep_hours;