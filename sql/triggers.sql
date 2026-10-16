CREATE TABLE IF NOT EXISTS gpa_change_log (
    log_id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT NOT NULL,
    old_gpa DECIMAL(5,2),
    new_gpa DECIMAL(5,2),
    changed_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE = InnoDB;

-- Recreate the trigger
DROP TRIGGER IF EXISTS after_gpa_update;

DELIMITER //

CREATE TRIGGER after_gpa_update
AFTER UPDATE ON student_sleep_mental_health_2026
FOR EACH ROW
BEGIN
    IF NOT (OLD.gpa <=> NEW.gpa) THEN
        INSERT INTO gpa_change_log
            (student_id, old_gpa, new_gpa)
        VALUES
            (OLD.student_id, OLD.gpa, NEW.gpa);
    END IF;
END //

DELIMITER ;

-- View the audit log
SELECT *
FROM gpa_change_log
ORDER BY log_id DESC
LIMIT 20;