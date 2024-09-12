# LearningConnect Design Document

By Aldona Stolarz

## Scope

### Purpose of the Database
LearningConnect database is to facilitate and enhance the learning esperience by integrating educational content with social interactions. This database supports learning platform that not only provides courses but also allows students to connect through groups and events.

### Inclusions and Exclusions
**Inclusions:**
- User profiles with attributes like `id` (UserID), `username`, `email`.
- User course through the `course` table with details like `course_id, course_name`, `duration_weeks`, `descripliton`.
- User `progress` with details like `progress_id`, `user_id`, `course_id`, `score`, `complitionn_date`.
- User `enrolment` table with details like `enrolment_id`, `user_id`, `course_id`, `entolment_date`.
- Content sharing functionality through the `grups` table.
- Table `groups_members` with attributes like `groups_members_id`, `group_id`, `user_id`.
- User matching functionality through the `events` table.
- Table `event_attendees` with details like `event_attendee_id`, `event_id`, `user_id`,`joined_at`.

**Exclusions:**
- No financial information (e.g. personal finance details, payment transaction).
- No highly sensitive personal information (e.g. personal addresses).

## Functional Requirements
* A student can register on LearningConnect, enroll in various courses, and track their progress.
* A student is able to join study groups related to their courses and participate in events.

### Beyond Scope
- Financial transactions or management.
- Detailed personal information not related to social connections.

## Representation

### Entities

**users:**
- `user_id` (Primary Key)
- `username`
- `email`

**course:**
- `course`
- `course_id`,
- `course_name`,
- `duration_weeks`,
- `description`,
-  PRIMARY KEY(`course_id`)

**enrollment:**
- `enrollment_id`,
- `user_id`,
-  `course_id`,
-  `enrollment_date`,
- PRIMARY KEY(`enrollment_id`),
- FOREIGN KEY(`user_id`) REFERENCES users(`user_id`),
- FOREIGN KEY(`course_id`) REFERENCES course(`course_id`)

**user_progress:**
- `progress_id`,
- `user_id`,
- `course_id`,
- `score`,
- `completion_date`,
-  PRIMARY KEY(`progress_id`),
- FOREIGN KEY(`user_id`) REFERENCES users(`user_id`),
-  FOREIGN KEY(`course_id`) REFERENCES course(`course_id`)

**groups:**
- `group_id`,
- `group_name`,
- `description`,
- PRIMARY KEY(`group_id`)

**group_members:**
- `group_member_id`,
- `group_id`,
- `user_id`,
- PRIMARY KEY(`group_member_id`),
- FOREIGN KEY(`group_id`) REFERENCES groups(`group_id`),
- FOREIGN KEY(`user_id`) REFERENCES users(`user_id`)

**events:**
- `event_id`,
- `event_name`,
- `description`,
- `event_date`,
- `location`,
- `created_by`,
- PRIMARY KEY(`event_id`),
- FOREIGN KEY(`created_by`) REFERENCES users(`user_id`)

**event_attendees:**
- `event_attendee_id`,
- `event_id`,
- `user_id`,
- `joined_at`,
- PRIMARY KEY(`event_attendee_id`),
-  FOREIGN KEY(`event_id`) REFERENCES events(`event_id`),
- FOREIGN KEY(`user_id`) REFERENCES users(`user_id`)

### Relationships

The entity relationship diagram below describes the relationships between entities in my database.
![LearningConnect](https://imgur.com/SmdzA7E.jpg)

**Descriptions:**
- Users can enroll in multiple Courses (one-to-many).
- Users can have multiple progress records in user_progress (one-to-many).
- Users can join multiple groups through group_member (one-to-many)s.
- Groups can have multiple members (users) through group_members (one-to-many).
- Users can create multiple events (one-to-many).
- Users can attend multiple events through event_attendees (one-to-many).
- Events can have multiple attendees (Users) through event_attendees (one-to-many).

## Optimizations
### Indexing
- Index on group_id for faster retrieval.
- Index on user_id for efficient queries involving users.
- Index on group_id and user_id for optimized group and users queries.

### Views
- View to display how to find the courses taken by a specific user.

## Limitations
- The platform does not handle financial transactions and detailed personal finance management.
- LearningConnect database remains focused on its core purpose of enhancing the educational and social interaction experience without the complexities and security concerns.
