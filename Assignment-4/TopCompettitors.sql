/* Write SQL Query to find out top competitors*/

CREATE TABLE Hackers (
    hacker_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

CREATE TABLE Difficulty (
    difficulty_level INT PRIMARY KEY,
    score INT NOT NULL
);

CREATE TABLE Challenges (
    challenge_id INT PRIMARY KEY,
    hacker_id INT,
    difficulty_level INT,
    FOREIGN KEY (hacker_id) REFERENCES Hackers(hacker_id),
    FOREIGN KEY (difficulty_level) REFERENCES Difficulty(difficulty_level)
);

CREATE TABLE Submissions (
    submission_id INT PRIMARY KEY,
    hacker_id INT,
    challenge_id INT,
    score INT,
    FOREIGN KEY (hacker_id) REFERENCES Hackers(hacker_id),
    FOREIGN KEY (challenge_id) REFERENCES Challenges(challenge_id)
);   
    
INSERT INTO Hackers VALUES
(5580, 'Rose'),
(8439, 'Angela'),
(27205, 'Frank'),
(52243, 'Patrick'),
(52348, 'Lisa'),
(57645, 'Kimberly'),
(77726, 'Bonnie'),
(83082, 'Michael'),
(86870, 'Todd'),
(90411, 'Joe');

INSERT INTO Difficulty VALUES
(1, 20),
(2, 30),
(3, 40),
(4, 60),
(5, 80),
(6, 100),
(7, 120);

INSERT INTO Challenges VALUES
(4810, 77726, 4),
(21089, 27205, 1),
(36566, 5580, 7),
(66730, 52243, 6),
(71055, 52243, 2);

INSERT INTO Submissions VALUES
(68628, 77726, 36566, 30),
(65300, 77726, 21089, 10),
(40326, 52243, 36566, 77),
(8941, 27205, 4810, 4),
(83554, 77726, 66730, 30),
(43353, 52243, 66730, 0),
(55385, 52348, 71055, 20),
(39784, 27205, 71055, 23),
(94613, 86870, 71055, 30),
(45788, 52348, 36566, 0),
(93058, 86870, 36566, 30),
(7344, 8439, 66730, 92),
(2721, 8439, 4810, 36),
(523, 5580, 71055, 4),
(49105, 52348, 66730, 0),
(55877, 57645, 66730, 80),
(38355, 27205, 66730, 35),
(3924, 8439, 36566, 80);  

UPDATE Submissions SET score = 100 WHERE submission_id = 7344; 
UPDATE Submissions SET score = 120 WHERE submission_id = 3924;  
UPDATE Submissions SET score = 100 WHERE submission_id = 55877;  
    
SELECT s.hacker_id, h.name, s.challenge_id, s.score, d.score AS max_score
FROM Submissions s
JOIN Hackers h ON s.hacker_id = h.hacker_id
JOIN Challenges c ON s.challenge_id = c.challenge_id
JOIN Difficulty d ON c.difficulty_level = d.difficulty_level
WHERE s.score = d.score;
