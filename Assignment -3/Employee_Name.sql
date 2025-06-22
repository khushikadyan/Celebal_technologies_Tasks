/*Employee Names : SQL Query to list all employess names*/

CREATE TABLE EMPLOYEE (
    employee_id INT,
    name VARCHAR(50),
    months INT,
    salary INT
);

/*sample data*/
INSERT INTO EMPLOYEE (employee_id, name, months, salary) VALUES (12228, 'Rose', 15, 1968);
INSERT INTO EMPLOYEE (employee_id, name, months, salary) VALUES (33645, 'Angela', 1, 3443);
INSERT INTO EMPLOYEE (employee_id, name, months, salary) VALUES (45692, 'Frank', 17, 1608);
INSERT INTO EMPLOYEE (employee_id, name, months, salary) VALUES (56118, 'Patrick', 7, 1345);
INSERT INTO EMPLOYEE (employee_id, name, months, salary) VALUES (59725, 'Lisa', 11, 2330);
INSERT INTO EMPLOYEE (employee_id, name, months, salary) VALUES (74197, 'Kimberly', 16, 4372);
INSERT INTO EMPLOYEE (employee_id, name, months, salary) VALUES (78454, 'Bonnie', 8, 1771);
INSERT INTO EMPLOYEE (employee_id, name, months, salary) VALUES (83565, 'Michael', 6, 2017);
INSERT INTO EMPLOYEE (employee_id, name, months, salary) VALUES (98607, 'Todd', 5, 3396);

SELECT name 
FROM Employee 
ORDER BY name;



