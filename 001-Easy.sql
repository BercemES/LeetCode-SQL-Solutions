-- Combine Two Tables

CREATE DATABASE Combine_Two_Tables;
USE Combine_Two_Tables;

#person tablosu olusturma
CREATE TABLE person(
personId int PRIMARY KEY AUTO_INCREMENT,
lastName varchar(50),
firstName varchar(50));

#tablo icerigini doldurma
insert into person(lastName, firstName)
VALUES
("Wang", "Allen"),
("Alice", "Bob");

# address tablosu olusturma ve icerigini doldurma
CREATE TABLE address(
addressId int PRIMARY KEY AUTO_INCREMENT,
personId int,
city varchar(50),
state varchar(50));
insert into address(personId, city, state)
values
(2, "New York City", "New York"),
(3, "Leetcode", "California");

select * from person;
select * from address;

/*Write a solution to report the first name, last name, city, and state of each person in the Person table.
If the address of a personId is not present in the Address table, report null instead.
Return the result table in any order.*/

#Cozum
select A.firstName, A.lastName, B.city, B.state from person A
LEFT JOIN address B
on A.personId = B.personID;

-- Duplicate Emails
/*Write a solution to report all the duplicate emails. Note that it's guaranteed that the email field is not NULL.
Return the result table in any order.*/

#Cozum
SELECT email from Person
GROUP BY email
HAVING COUNT(email) > 1;

/*Write a solution to find the employees who earn more than their managers.
Return the result table in any order.*/

#Cozum
SELECT E.name AS Employee FROM Employee E
JOIN Employee M 
ON E.managerId = M.id
WHERE E.salary > M.salary;

/*Write a solution to find all customers who never order anything.
Return the result table in any order.*/

#Cozum
SELECT name AS Customers FROM Customers A
LEFT JOIN Orders B ON A.id = B.CustomerId
WHERE B.customerId IS NULL;


/*Write a solution to delete all duplicate emails, keeping only one unique email with the smallest id.
For SQL users, please note that you are supposed to write a DELETE statement and not a SELECT one.
After running your script, the answer shown is the Person table.
The driver will first compile and run your piece of code and then show the Person table. The final order of the Person table does not matter.*/

#Cozum
DELETE p1 FROM Person p1
LEFT JOIN Person p2
ON p1.email = p2.email AND p1.id > p2.id
WHERE p2.id IS NOT NULL;
