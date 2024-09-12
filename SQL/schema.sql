--Table Users to store information about them
CREATE TABLE `users` (
    `user_id` INT AUTO_INCREMENT,
    `username` VARCHAR(255) NOT NULL UNIQUE,
    `email` VARCHAR(255) NOT NULL UNIQUE ,
    PRIMARY KEY(`user_id`)
);

-- Table Course contains details about the course
CREATE TABLE `course` (
    `course_id` INT AUTO_INCREMENT,
    `course_name` VARCHAR(255) NOT NULL,
    `duration_weeks` INT NOT NULL,
    `description` TEXT,
    PRIMARY KEY(`course_id`)
);

-- Enrollments table to tracks which user is enrolled in which course.
CREATE TABLE `enrollment` (
   `enrollment_id` INT AUTO_INCREMENT,
   `user_id` INT NOT NULL,
   `course_id` INT NOT NULL,
   `enrollment_date` DATE,
   PRIMARY KEY(`enrollment_id`),
   FOREIGN KEY(`user_id`) REFERENCES users(`user_id`),
   FOREIGN KEY(`course_id`) REFERENCES course(`course_id`)
);

-- Table tracks user progress within course
CREATE TABLE `user_progress` (
    `progress_id` INT AUTO_INCREMENT,
    `user_id` INT NOT NULL,
    `course_id` INT NOT NULL,
    `score` INT NOT NULL,
    `completion_date` DATE NOT NULL,
    PRIMARY KEY(`progress_id`),
    FOREIGN KEY(`user_id`) REFERENCES users(`user_id`),
    FOREIGN KEY(`course_id`) REFERENCES course(`course_id`)
);

-- Table manages student groups
CREATE TABLE `groups` (
    `group_id` INT AUTO_INCREMENT,
    `group_name` VARCHAR(100) NOT NULL,
    `description` TEXT,
    PRIMARY KEY(`group_id`)
);

-- Table shows which users are members of which groups
CREATE TABLE `group_members` (
    `group_member_id` INT AUTO_INCREMENT,
    `group_id` INT NOT NULL,
    `user_id` INT NOT NULL,
    PRIMARY KEY(`group_member_id`),
    FOREIGN KEY(`group_id`) REFERENCES groups(`group_id`),
    FOREIGN KEY(`user_id`) REFERENCES users(`user_id`)
);

-- Table stores information about events
CREATE TABLE `events` (
    `event_id` INT AUTO_INCREMENT,
    `event_name` VARCHAR(100) NOT NULL,
    `description` TEXT,
    `event_date` DATE NOT NULL,
    `location` VARCHAR(255) NOT NULL,
    `created_by` INT NOT NULL,
    PRIMARY KEY(`event_id`),
    FOREIGN KEY(`created_by`) REFERENCES users(`user_id`)
);

-- Table to manage many-to-many relationship between users and events
CREATE TABLE `event_attendees` (
    `event_attendee_id` INT AUTO_INCREMENT,
    `event_id` INT NOT NULL,
    `user_id` INT NOT NULL,
    `joined_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY(`event_attendee_id`),
    FOREIGN KEY(`event_id`) REFERENCES events(`event_id`),
    FOREIGN KEY(`user_id`) REFERENCES users(`user_id`)
);

-- Index on group_id
CREATE INDEX `idx_group_id` ON group_members(`group_id`);

-- Index on user_id
CREATE INDEX `idx_user_id` ON group_members(`user_id`);

-- Index on group_id and user_id
CREATE INDEX `idx_group_user` ON group_members(`group_id`, `user_id`);

