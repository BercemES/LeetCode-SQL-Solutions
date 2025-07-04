/*Find the name of the user who has rated the greatest number of movies. In case of a tie, return the lexicographically smaller user name.
Find the movie name with the highest average rating in February 2020. In case of a tie, return the lexicographically smaller movie name.*/

-- En fazla oy veren kullanıcı (eşitlikte isim alfabetik)
#Cozum
select (
select A.name from Users A
JOIN MovieRating B
ON A.user_id = B.user_id
GROUP BY B.user_id
ORDER BY COUNT(B.user_id) DESC, A.name ASC
LIMIT 1) AS results

-- iki farklı sonucu alt alta gör
UNION ALL

-- Şubat 2020'de ortalaması en yüksek film (eşitlikte isim alfabetik)
select (
select A.title from Movies A
JOIN MovieRating B ON A.movie_id = B.movie_id
WHERE YEAR(B.created_at) = 2020 AND MONTH(B.created_at) = 2
GROUP BY B.movie_id
ORDER BY AVG(B.rating) DESC, A.title ASC
LIMIT 1)
AS results;