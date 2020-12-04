CREATE TABLE Employees (
staffNo int PRIMARY KEY,
fName varchar(255),
lName varchar(255),
address varchar(255),
salary int,
phonenum varchar(12)
);

INSERT INTO Employees VALUES(23, 'Carl', 'Bowler', '6 East Creek Ave', 35000, '359-623-5345');
INSERT INTO Employees VALUES(54, 'Toby', 'Prince', '12 Golden Star St', 23000, '456-675-3636');
INSERT INTO Employees VALUES(34, 'Cherry', 'Walter', '331 Cactus St', 30000, '246-275-8678');
INSERT INTO Employees VALUES(46, 'Ruben', 'Thorne', '7818 Lakeview Dr', 45000, '213-464-7456');
INSERT INTO Employees VALUES(13, 'Kaitlin', 'Morrow', '4 E. Peachtree Drive', 37500, '535-366-6462');

CREATE TABLE Client (
clientNo int PRIMARY KEY,
fName varchar(255),
lName varchar(255),
address varchar(255),
phonenum varchar(12)
);

INSERT INTO Client VALUES(1, 'Nolan', 'Lopez', '10 Beach Court', '345-745-3461');
INSERT INTO Client VALUES(2, 'Ashlea', 'Salas', '8890 Shore Rd', '236-643-7456');
INSERT INTO Client VALUES(3, 'Scott', 'Cooley', '590 Green Hill St', '357-353-7858');
INSERT INTO Client VALUES(4, 'Zach', 'Dennis', '370 Old Bradford St', '134-636-4631');
INSERT INTO Client VALUES(5, 'Rocco', 'Newman', '891 E. Border Street', '743-135-1153');

CREATE TABLE Equipment (
equipmentNo int PRIMARY KEY,
description varchar(255),
usage varchar(255),
cost int
);

INSERT INTO Equipment VALUES(3, 'Electric Broom', 'Rough spot cleaning', 130);
INSERT INTO Equipment VALUES(6, 'Portable Washer', 'Clean fabrics', 200);
INSERT INTO Equipment VALUES(7, 'Portable Vacuum', 'Reach tight corners', 15);
INSERT INTO Equipment VALUES(13, 'Squeegee', 'Move liquids', 25);
INSERT INTO Equipment VALUES(27, 'Extra large trash bags', 'Dispose of large trash', 10);

CREATE TABLE Services (
requirementNo int PRIMARY KEY,
clientNo int,
dayOfWeek varchar(255),
startTime varchar(255),
endTime varchar(255),
FOREIGN KEY (clientNo) REFERENCES Client(clientNo)
);

INSERT INTO Services VALUES(1, 2, 'MWF', '9:00AM', '12:00PM');
INSERT INTO Services VALUES(2, 5, 'TuTh', '12:00PM', '3:00PM');
INSERT INTO Services VALUES(3, 3, 'MTuW', '7:00PM', '10:00PM');
INSERT INTO Services VALUES(4, 4, 'MTuWThF', '3:00AM', '6:00AM');
INSERT INTO Services VALUES(5, 1, 'WF', '10:00PM', '1:00AM');

CREATE TABLE employeeWork(
staffNo int,
requirementNo int,
daysWorked varchar(255),
PRIMARY KEY (staffNo, requirementNo), 
FOREIGN KEY (staffNo) REFERENCES Employees(staffNo),
FOREIGN KEY (requirementNo) REFERENCES Services(requirementNo)
);

INSERT INTO employeeWork VALUES(34, 3, 'MTu');
INSERT INTO employeeWork VALUES(46, 5, 'F');
INSERT INTO employeeWork VALUES(23, 2, 'TuTh');
INSERT INTO employeeWork VALUES(54, 4, 'TuTh');
INSERT INTO employeeWork VALUES(13, 1, 'MW');

CREATE TABLE equipmentUsed(
equipmentNo int,
requirementNo int,
timeUsed varchar(255),
PRIMARY KEY (equipmentNo, requirementNo),
FOREIGN KEY (equipmentNo) REFERENCES Equipment(equipmentNo),
FOREIGN KEY (requirementNo) REFERENCES Services(requirementNo)
);

INSERT INTO equipmentUsed VALUES(6, 2, '1:30PM-2:00PM');
INSERT INTO equipmentUsed VALUES(27, 4, '4:00AM-5:00AM');
INSERT INTO equipmentUsed VALUES(13, 1, '9:00AM-11:30AM');
INSERT INTO equipmentUsed VALUES(3, 5, '12:30AM-1:00AM');
INSERT INTO equipmentUsed VALUES(7, 3, '7:30PM-8:00PM');
