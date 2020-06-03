/* schema 
 */
Create table Person (PersonId int, FirstName varchar(255), LastName varchar(255))
Create table Address (AddressId int, PersonId int, City varchar(255), State varchar(255))
Truncate table Person
insert into Person (PersonId, LastName, FirstName) values ('1', 'Wang', 'Allen')
Truncate table Address
insert into Address (AddressId, PersonId, City, State) values ('1', '2', 'New York City', 'New York')

/*
Person
+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| PersonId    | int     |
| FirstName   | varchar |
| LastName    | varchar |
+-------------+---------+

Address
+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| AddressId   | int     |
| PersonId    | int     |
| City        | varchar |
| State       | varchar |
+-------------+---------+
*/

/* Write a SQL query for a report that provides the following information for each person in the Person table, regardless if there is an address for each of those people:
 */
select FirstName, LastName, City, State
from Person left outer join Address
on Person.PersonId = Address.PersonId
;


/* Write a SQL query to get the nth highest salary from the Employee table. 
 */
CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
BEGIN
DECLARE M INT;
SET M=N-1;
RETURN (
    # Write your MySQL query statement below.
    SELECT IFNULL(
        (
            SELECT DISTINCT Salary 
            FROM Employee
            ORDER BY Salary DESC
            LIMIT 1 OFFSET M
        ), 
        NULL
    ) AS getNthHighestSalary
);
END


/* Write a SQL query to rank scores. If there is a tie between two scores, both should have the same ranking. Note that after a tie, the next ranking number should be the next consecutive integer value. In other words, there should be no "holes" between ranks.
 */

Select Score,
(
    SELECT COUNT(*)
    FROM (SELECT DISTINCT Score S FROM Scores) TMP
    WHERE S >= Score
) "Rank"
FROM Scores
ORDER BY Score DESC

