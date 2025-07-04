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

/* Write a solution to report the first name, last name, city, and state of each person in the Person table. 
If the address of a personId is not present in the Address table, report null instead.
Return the result table in any order. */
#Cozum
select A.firstName, A.lastName, B.city, B.state from person A
LEFT JOIN address B
on A.personId = B.personID;
