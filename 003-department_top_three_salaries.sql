/*A company's executives are interested in seeing who earns the most money in each of the company's departments. 
A high earner in a department is an employee who has a salary in the top three unique salaries for that department.
Write a solution to find the employees who are high earners in each of the departments.
Return the result table in any order.*/

-- Her departmandan, en yüksek 3 farklı maaşa sahip çalışanları listelemek.
/*
İç sorgu:
   - `DENSE_RANK()` fonksiyonu her departman özelinde (`PARTITION BY departmentId`) maaşlar büyükten küçüğe sıralanır.
   - Aynı maaşa sahip olan çalışanlara aynı sıra verilir.
Dış sorgu:
   - Sıra değeri 3’ten küçük veya eşit olanlar filtrelenir (`ranking <= 3`).
   - Sonuç olarak her departmandaki en yüksek 3 maaşa (eşitlik durumunda daha fazla kişiye) sahip çalışanlar döner.*/

#Cozum
Select Department, Employee, Salary FROM (
select B.name AS Department, A.name AS Employee, A.salary AS Salary,
DENSE_RANK() OVER (
    PARTITION BY A.departmentId ORDER BY Salary DESC) AS ranking
FROM Employee A
JOIN Department B ON B.id = A.departmentId
) AS ranked
WHERE ranking < 4
ORDER BY SALARY DESC, Department ASC;
