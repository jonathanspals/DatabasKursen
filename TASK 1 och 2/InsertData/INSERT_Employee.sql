INSERT INTO Employee (employeeId, firstName, lastName, title, email, phone, salary, managerId, departmentId)
VALUES
('E1', 'Alice', 'Andersson', 'Professor', 'alice@kth.se', '070-1111111', 55000, NULL, 'D1'),
('E2', 'Bob', 'Berg', 'Lecturer', 'bob@kth.se', '070-2222222', 48000, 'E1', 'D1'),
('E3', 'Carla', 'Cruz', 'Assistant Professor', 'carla@kth.se', '070-3333333', 52000, 'E1', 'D1'),

('E4', 'David', 'Dahl', 'Professor', 'david@kth.se', '070-4444444', 56000, NULL, 'D2'),
('E5', 'Eva', 'EkstrÃ¶m', 'Lecturer', 'eva@kth.se', '070-5555555', 47000, 'E4', 'D2'),
('E6', 'Fredrik', 'Fors', 'Researcher', 'fredrik@kth.se', '070-6666666', 51000, 'E4', 'D2'),

('E7', 'Gina', 'Gustavsson', 'Professor', 'gina@kth.se', '070-7777777', 58000, NULL, 'D3'),
('E8', 'Hugo', 'Holm', 'Lecturer', 'hugo@kth.se', '070-8888888', 46000, 'E7', 'D3'),
('E9', 'Ida', 'Isaksson', 'Assistant Professor', 'ida@kth.se', '070-9999999', 50000, 'E7', 'D3'),

('E10', 'Johan', 'Jonsson', 'Administrator', 'johan@kth.se', '070-1212121', 40000, NULL, 'D1');

/* uppdatera employee till manager */
UPDATE Department SET departmentManagerId = 'E1' WHERE departmentId = 'D1';
UPDATE Department SET departmentManagerId = 'E4' WHERE departmentId = 'D2';
UPDATE Department SET departmentManagerId = 'E7' WHERE departmentId = 'D3';