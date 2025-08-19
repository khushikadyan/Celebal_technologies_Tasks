/*Question based on joins*/


CREATE TABLE Hackers2 (
    hacker_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

CREATE TABLE Submissions2 (
    submission_id INT PRIMARY KEY,
    hacker_id INT,
    challenge_id INT,
    score INT,
    FOREIGN KEY (hacker_id) REFERENCES Hackers2(hacker_id)
);

INSERT INTO Hackers2 VALUES
(4071, 'Rose'),
(4806, 'Angela'),
(26071, 'Frank'),
(49438, 'Patrick'),
(74842, 'Lisa'),
(80305, 'Kimberly'),
(84072, 'Bonnie'),
(87868, 'Michael'),
(92118, 'Todd'),
(95895, 'Joe');

INSERT INTO Submissions2 VALUES
(67194, 74842, 63132, 76),
(64479, 74842, 19797, 98),
(40742, 26071, 49593, 20),
(17513, 4806, 49593, 32),
(69846, 80305, 19797, 19),
(41002, 26071, 89343, 36),
(52826, 49438, 49593, 9),
(31093, 26071, 19797, 2),
(81614, 84072, 49593, 100),
(44829, 26071, 89343, 17),
(75147, 80305, 49593, 48),
(14115, 4806, 49593, 76),
(6943, 4071, 19797, 95),
(12855, 4806, 25917, 13),
(73343, 80305, 49593, 42),
(84264, 84072, 63132, 0),
(9951, 4071, 49593, 43),
(45104, 49438, 25917, 34),
(53795, 74842, 19797, 5);

SELECT h.hacker_id, h.name, SUM(max_scores.max_score) AS total_score
FROM Hackers h
JOIN (
    SELECT hacker_id, challenge_id, MAX(score) AS max_score
    FROM Submissions
    GROUP BY hacker_id, challenge_id
) max_scores ON h.hacker_id = max_scores.hacker_id
GROUP BY h.hacker_id, h.name
HAVING SUM(max_scores.max_score) > 0
ORDER BY total_score DESC, h.hacker_id ASC;