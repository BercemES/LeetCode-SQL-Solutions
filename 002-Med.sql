-- Second Highest Salary
/*Write a solution to find the second highest distinct salary from the Employee table.
If there is no second highest salary, return null (return None in Pandas).*/

-- Aynı maaşlar varsa tekrarları önlemek için DISTINCT kullandım.
-- 2. en yüksek maaş yoksa NULL dönmesi için iç içe sorgu kullandım.

#Cozum
SELECT
(SELECT DISTINCT salary FROM Employee
ORDER BY salary DESC
LIMIT 1 OFFSET 1
)AS SecondHighestSalary;

-- Nth Highest Salary
/*Write a solution to find the nth highest distinct salary from the Employee table. 
If there are less than n distinct salaries, return null.*/

# Cozum
CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
BEGIN
  RETURN (
      # Write your MySQL query statement below.
    SELECT salary FROM (
    select DISTINCT salary,
    DENSE_RANK() OVER (ORDER BY salary DESC) as rnk
    FROM Employee
  ) AS ranked
  WHERE rnk = N
  LIMIT 1
 );
END

-- Rank Scores
/*Write a solution to find the rank of the scores. The ranking should be calculated according to the following rules:
The scores should be ranked from the highest to the lowest.
If there is a tie between two scores, both should have the same ranking.
After a tie, the next ranking number should be the next consecutive integer value. In other words, there should be no holes between ranks.
Return the result table ordered by score in descending order.*/

#Cozum
SELECT score, `rank` FROM (
    SELECT score, 
        DENSE_RANK() OVER (ORDER BY score DESC) as `rank`
    FROM Scores
    ORDER BY score DESC
) as ranked;

-- Consecutive Numbers
/*Find all numbers that appear at least three times consecutively.
Return the result table in any order.*/

-- Aynı tabloyu tekrar tekrar çağırarak art arda sıraları kıyasladım.
#Cozum
SELECT DISTINCT L1.num AS ConsecutiveNums
FROM Logs L1
JOIN Logs L2 ON L1.id = L2.id-1
JOIN Logs L3 ON L1.id = L3.id-2
WHERE
    L1.num = L2.num AND L2.num = L3.num;

-- Department Highest Salary
/*Write a solution to find employees who have the highest salary in each of the departments.
Return the result table in any order.*/

-- İç içe sorgu - DENSE_RANK ile sıralama PARTITION BY ile departman bazında gruplama
#Cozum
SELECT Department, Employee, Salary FROM (
SELECT B.name AS Department, A.name AS Employee, A.salary AS Salary,
    DENSE_RANK() OVER (PARTITION BY B.id ORDER BY A.salary DESC) as rnk
FROM Employee A
JOIN Department B ON A.departmentId = B.id
)AS ranked
WHERE rnk = 1;
