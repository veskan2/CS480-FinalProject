CS480-FinalProject
Project Description
The objective is to develop a web-based self-study room reservation management system using Spring Boot and MySQL. This system will allow students to reserve study rooms and manage their reservations, while administrators can manage student and room information, view reservation records, and manage blacklists.

Overview:
The goal is to create a self-study room reservation management application with two user roles: students and administrators. Administrators can manage student and room information, view reservation records, and manage blacklists, while students can reserve rooms, view and cancel reservations, and manage personal information.

Data Requirements
Administrators
For each administrator, record their name, employee ID, email, and contact information.

Students
For each student, record their name, student ID, email, and contact information. Maintain a blacklist status to restrict room reservations if needed.

Study Rooms
Each room will have a unique ID, room name or number, capacity, and availability status (open or closed).

Reservations
Each reservation records the student ID, room ID, start and end times, and the status (active or canceled).

Application Requirements
The application should support the following actions for administrators and students. Both users must log in with their email and a password created upon initial registration.

Administrators
Manage Student Information:
Register new students.

Update student information (such as name and contact details).

Manage the blacklist status of students, preventing them from reserving rooms if blacklisted.

Manage Room Information
Add, update, or delete room information.

Change room status (open or closed) to control availability for reservation.

View Reservation Records
View reservation details, including room, student information, and reservation status.
Students
Reserve a Room
View available rooms, select reservation times, and submit reservations. Only open rooms can be reserved.

Students should be notified if they are on the blacklist and cannot make a reservation.

Manage Reservations
View, cancel, or reschedule reservations. Reservation cancellation or changes can only be made if the reservation period has not yet begun.
Update Personal Information
Students can update their profile information, such as name, contact details, and password.
Optional Bonus Features
Conflict Checking for Reservations
Implement logic to detect and prevent double bookings or overlapping reservations for a single room and time period.
Notification System
Implement email or SMS notifications for reservation confirmations, cancellations, and reminders.
Reporting and Analytics for Administrators
Generate reports on room usage, reservation trends, and blacklist statistics.
