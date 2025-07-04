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
