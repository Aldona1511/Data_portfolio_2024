-- In this SQL file, write (and comment!) the typical SQL queries users will run on your database
-- Query to insert a new users
INSERT INTO `users` (`username`, `email`) VALUES
('jane', 'jane.jones@example.com'),
('johnmay', 'john.may@example.com'),
('lisalow', 'lisa.low@example.com'),
('marta', 'marta.smith@example.com'),
('aldona', 'aldona.sto@example.com');

-- Query to create courses
INSERT INTO `course` (`course_name`, `duration_weeks`, `description`) VALUES
('programming with C', '12', 'indroduction'),
('programming with python', '25', 'advanced'),
('programming with java', '21', 'advanced'),
('programming with rust', '10', 'advanced');

-- Query to create events
INSERT INTO `events` (`event_name`, `description`, `event_date`, `location`, `created_by`) VALUES
('fun and code', 'annual science fair, party games', '12-12-2024', 'london', 2),
('art of programming', 'celebration of the creativity and craftsmanship', '10-12-2024', 'liverpool', 1);

-- Query to insert event_attendees
INSERT INTO `event_attendees` (`event_id`, `user_id`, `joined_at`) VALUES
(1, 2, CURRENT_TIMESTAMP),
(2, 1, CURRENT_TIMESTAMP);

-- Query to insert enrollment
INSERT INTO `enrollment` (`user_id`,`course_id`, `enrollment_date`) VALUES
(1, 1, `10-03-2024`);

-- View to display how to find the courses taken by a specific user
CREATE VIEW `jane_course` AS
SELECT `course`.`course_name`, `course`.`duration_weeks`, `course`.`description`
FROM `course`
JOIN `enrollment` ON `course`.`course_id` = `enrollment`.`course_id`
JOIN `users` ON `enrollment`.`user_id` = `users`.`user_id`
WHERE `users`.`username` = 'jane';

-- Query to retrieve all users
SELECT * FROM `users`;

-- Query to retrieve courses
SELECT * FROM `course`;

-- Query to find events a user is attending
SELECT `event_name`, `description`, `event_date`, `location`, `created_by`
FROM `events`
WHERE `events`.`event_id` IN (
    SELECT `event_attendees`.`event_id`
    FROM `event_attendees`
    WHERE `event_attendees`.`user_id` = 1
);

-- Sample query to delete user
DELETE FROM `users`
WHERE `username` = 'marta';
