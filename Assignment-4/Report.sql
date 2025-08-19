/* Write a SQL Query to create a report*/

CREATE TABLE Students (
    ID INT,
    Name VARCHAR(255),
    Marks INT
);

CREATE TABLE Grades (
    Grade INT PRIMARY KEY,
    Min_Mark INT NOT NULL,
    Max_Mark INT NOT NULL,
    CHECK (Min_Mark <= Max_Mark),
    CHECK (Grade BETWEEN 1 AND 10)
);

INSERT INTO Grades (Grade, Min_Mark, Max_Mark) VALUES
(1, 0, 9),
(2, 10, 19),
(3, 20, 29),
(4, 30, 39),
(5, 40, 49),
(6, 50, 59),
(7, 60, 69),
(8, 70, 79),
(9, 80, 89),
(10, 90, 100);

INSERT INTO Students (ID, Name, Marks) VALUES
(1, 'Julia', 88),
(2, 'Samantha', 68),
(3, 'Maria', 99),
(4, 'Scarlet', 78),
(5, 'Ashley', 63),
(6, 'Jane', 81),
(7, 'Lily', 75),     
(8, 'Robert', 30),    
(9, 'Emily', 92),    
(10, 'David', 55);  

SELECT 
    CASE 
        WHEN g.Grade >= 8 THEN s.Name 
        ELSE NULL 
    END AS Name,
    g.Grade,
    s.Marks
FROM 
    Students s
JOIN 
    Grades g ON s.Marks BETWEEN g.Min_Mark AND g.Max_Mark
ORDER BY 
    g.Grade DESC,
    CASE WHEN g.Grade >= 8 THEN s.Name END ASC,
    CASE WHEN g.Grade < 8 THEN s.Marks END ASC;
