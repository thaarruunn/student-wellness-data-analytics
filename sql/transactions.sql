CREATE TABLE IF NOT EXISTS transaction_demo (
    demo_id INT PRIMARY KEY,
    description VARCHAR(100),
    amount DECIMAL(10,2)
) ENGINE = InnoDB;

-- Clean up old demonstration rows
DELETE FROM transaction_demo
WHERE demo_id IN (1, 2);

START TRANSACTION;

INSERT INTO transaction_demo
    (demo_id, description, amount)
VALUES
    (1, 'Example record A', 100.00),
    (2, 'Example record B', 200.00);

SELECT *
FROM transaction_demo;

-- ROLLBACK cancels the uncommitted inserts
ROLLBACK;

-- These rows should no longer exist
SELECT *
FROM transaction_demo
WHERE demo_id IN (1, 2);