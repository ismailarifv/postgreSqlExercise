/*
ÖDEV1

1-film tablosunda bulunan title ve description sütunlarındaki verileri sıralayınız.
2-film tablosunda bulunan tüm sütunlardaki verileri film uzunluğu (length) 60 dan büyük VE 75 ten küçük olma koşullarıyla 
sıralayınız.
3-film tablosunda bulunan tüm sütunlardaki verileri rental_rate 0.99 VE replacement_cost 12.99 VEYA 28.99 olma koşullarıyla 
sıralayınız.
4-customer tablosunda bulunan first_name sütunundaki değeri 'Mary' olan müşterinin last_name sütunundaki değeri nedir?
5-film tablosundaki uzunluğu(length) 50 ten büyük OLMAYIP aynı zamanda rental_rate değeri 2.99 veya 4.99 OLMAYAN verileri 
sıralayınız.
*/

--1.Soru
SELECT title, description FROM film;

--2.Soru
SELECT * FROM film 
WHERE length > 60 AND length < 75;

--3.Soru
SELECT * FROM film 
WHERE rental_rate = 0.99 AND (replacement_cost = 12.99 OR replacement_cost=28.99);

--4.Soru
SELECT first_name,last_name  FROM customer
WHERE first_name='Mary'; --Cevap Smith

--5.Soru
SELECT length, rental_rate FROM film;
WHERE NOT length > 50 AND (NOT(rental_rate =2.99 OR  rental_rate=4.99)); 

/*
ÖDEV2
1-film tablosunda bulunan tüm sütunlardaki verileri replacement cost değeri 12.99 dan büyük eşit ve 16.99 küçük olma 
koşuluyla sıralayınız ( BETWEEN - AND yapısını kullanınız.)
2-.actor tablosunda bulunan first_name ve last_name sütunlardaki verileri first_name 'Penelope' veya 'Nick' veya 'Ed' 
değerleri olması koşuluyla sıralayınız. ( IN operatörünü kullanınız.)
3-film tablosunda bulunan tüm sütunlardaki verileri rental_rate 0.99, 2.99, 4.99 VE replacement_cost 12.99, 15.99, 28.99
 olma koşullarıyla sıralayınız. ( IN operatörünü kullanınız.)
*/

--1.Soru
SELECT * FROM film
WHERE replacement_cost BETWEEN 12.99 AND 16.99;

--2.Soru
SELECT first_name, last_name FROM actor
WHERE first_name IN('Penelope', 'Nick', 'Ed');

--3.Soru
SELECT * FROM film
WHERE rental_rate IN(0.99,2.99,4.99) AND replacement_cost IN(12.99,15.99,28.99);

/*
ÖDEV3
1-country tablosunda bulunan country sütunundaki ülke isimlerinden 'A' karakteri ile başlayıp 'a' karakteri ile 
sonlananları sıralayınız.
2-country tablosunda bulunan country sütunundaki ülke isimlerinden en az 6 karakterden oluşan ve sonu 'n' karakteri ile
 sonlananları sıralayınız.
3-film tablosunda bulunan title sütunundaki film isimlerinden en az 4 adet büyük ya da küçük harf farketmesizin 'T' 
karakteri içeren film isimlerini sıralayınız.
4-film tablosunda bulunan tüm sütunlardaki verilerden title 'C' karakteri ile başlayan ve uzunluğu (length) 90 dan büyük
olan ve rental_rate 2.99 olan verileri sıralayınız.
*/

--1.Soru
SELECT country FROM country
WHERE country ~~ 'A%a';

--2.Soru
SELECT country FROM country
WHERE country LIKE '%_____n';

--3.Soru
SELECT title FROM film
WHERE title ILIKE '%t%t%t%t%t%';

--4.Soru
SELECT * FROM film
WHERE title LIKE 'C%' AND length > 90 AND rental_rate = 2.99;

/*
ÖDEV4
1-film tablosunda bulunan replacement_cost sütununda bulunan birbirinden farklı değerleri sıralayınız.
2-film tablosunda bulunan replacement_cost sütununda birbirinden farklı kaç tane veri vardır?
3-film tablosunda bulunan film isimlerinde (title) kaç tanesini T karakteri ile başlar ve aynı zamanda rating 'G' ye 
eşittir?
4-country tablosunda bulunan ülke isimlerinden (country) kaç tanesi 5 karakterden oluşmaktadır?
5-city tablosundaki şehir isimlerinin kaç tanesi 'R' veya r karakteri ile biter?
*/

--1.Soru
SELECT DISTINCT replacement_cost FROM film;

--2.Soru
SELECT COUNT(DISTINCT replacement_cost) FROM film;

--3.Soru
SELECT COUNT(*) FROM film
WHERE title LIKE 'T%' AND rating = 'G';

--4.Soru
SELECT COUNT(*) FROM country
WHERE country LIKE '_____';

--5.Soru
SELECT COUNT(*) FROM city
WHERE city ILIKE '%r';


/*
ÖDEV5
1-film tablosunda bulunan ve film ismi (title) 'n' karakteri ile biten en uzun (length) 5 filmi sıralayınız.
2-film tablosunda bulunan ve film ismi (title) 'n' karakteri ile biten en kısa (length) ikinci(6,7,8,9,10) 
5 filmi(6,7,8,9,10) sıralayınız.
3-customer tablosunda bulunan last_name sütununa göre azalan yapılan sıralamada store_id 1 olmak koşuluyla ilk 4 veriyi 
sıralayınız.
*/

--1.Soru
SELECT * FROM film
WHERE title LIKE '%n'
ORDER BY length DESC
LIMIT 5;

--2.Soru
SELECT * FROM film
WHERE title LIKE '%n'
ORDER BY length 
OFFSET 5
LIMIT 5;

--3.Soru
SELECT * FROM customer
WHERE store_id = 1
ORDER BY last_name DESC
LIMIT 4;

/* 
Ödev6
1-film tablosunda bulunan rental_rate sütunundaki değerlerin ortalaması nedir?
2-film tablosunda bulunan filmlerden kaç tanesi 'C' karakteri ile başlar?
3-film tablosunda bulunan filmlerden rental_rate değeri 0.99 a eşit olan en uzun (length) film kaç dakikadır?
4-film tablosunda bulunan filmlerin uzunluğu 150 dakikadan büyük olanlarına ait kaç farklı replacement_cost değeri vardır?
*/

--1.Soru
SELECT AVG(rental_rate) FROM film;

--2.Soru
SELECT Count(*) FROM film
WHERE title LIKE ('C%');

--3.Soru
SELECT MAX(length) FROM film
WHERE rental_rate = 0.99;

--4.Soru
SELECT COUNT(DISTINCT(replacement_cost)) FROM film
WHERE length > 150;

/* 
Ödev7
1-film tablosunda bulunan filmleri rating değerlerine göre gruplayınız.
2-film tablosunda bulunan filmleri replacement_cost sütununa göre grupladığımızda film sayısı 50 den fazla olan 
replacement_cost değerini ve karşılık gelen film sayısını sıralayınız.
3-customer tablosunda bulunan store_id değerlerine karşılık gelen müşteri sayılarını nelerdir? 
4-City tablosunda bulunan şehir verilerini country_id sütununa göre gruplandırdıktan sonra en fazla şehir sayısı 
barındıran country_id bilgisini ve şehir sayısını paylaşınız.
*/

--1.Soru
SELECT rating FROM film
GROUP BY rating ;

--2.Soru
SELECT replacement_cost, COUNT(*) FROM film
GROUP BY replacement_cost
HAVING COUNT(*) > 50;

--3.Soru
SELECT store_id , COUNT(*) FROM customer
GROUP BY store_id;

--4.Soru
SELECT country_id, COUNT(*) FROM city
GROUP BY country_id
ORDER BY COUNT(*) DESC
LIMIT 1;

/*
Ödev8
1-test veritabanınızda employee isimli sütun bilgileri id(INTEGER), name VARCHAR(50), birthday DATE, email VARCHAR(100) 
olan bir tablo oluşturalım.
2-Oluşturduğumuz employee tablosuna 'Mockaroo' servisini kullanarak 50 adet veri ekleyelim.
3-Sütunların her birine göre diğer sütunları güncelleyecek 5 adet UPDATE işlemi yapalım.
4-Sütunların her birine göre ilgili satırı silecek 5 adet DELETE işlemi yapalım.
*/
--1.Soru
CREATE TABLE employee (
    id INTEGER,
    name VARCHAR(50),
    birthday DATE,
    email VARCHAR(100)
)
--2.Soru
--EKLENDİ

--3.Soru
UPDATE employee
SET name ='İsmail',
    birthday ='1998-11-01',
    email = 'i.arifgulec8110@gmail.com'
WHERE id=1 ;
UPDATE employee
SET name = 'Eslem',
    birthday = '1999-11-22',
    email = 'eslem_tifi@outllok.com'
WHERE name LIKE 'A%';

--4.Soru
DELETE FROM employee
WHERE name = 'Eslem';
DELETE FROM employee
WHERE id = 1;
DELETE FROM employee
WHERE name LIKE 'C%';

/* 
Ödev9
1-city tablosu ile country tablosunda bulunan şehir (city) ve ülke (country) isimlerini birlikte görebileceğimiz INNER JOIN
sorgusunu yazınız.
2-customer tablosu ile payment tablosunda bulunan payment_id ile customer tablosundaki first_name ve last_name isimlerini 
birlikte görebileceğimiz INNER JOIN sorgusunu yazınız.
3-customer tablosu ile rental tablosunda bulunan rental_id ile customer tablosundaki first_name ve last_name isimlerini
birlikte görebileceğimiz INNER JOIN sorgusunu yazınız.
*/

--1.Soru
SELECT city,country FROM country
INNER JOIN city ON city.country_id = country.country_id; 

--2.Soru    
SELECT first_name,last_name,payment_id FROM customer
INNER JOIN payment ON customer.customer_id = payment.customer_id; 

--3.Soru
Select first_name,last_name,rental_id from rental
INNER JOIN customer ON customer.customer_id = rental.customer_id;

/* 
Ödev10
1-city tablosu ile country tablosunda bulunan şehir (city) ve ülke (country) isimlerini birlikte görebileceğimiz LEFT JOIN
sorgusunu yazınız.
2-customer tablosu ile payment tablosunda bulunan payment_id ile customer tablosundaki first_name ve last_name isimlerini 
birlikte görebileceğimiz RIGHT JOIN sorgusunu yazınız.
3-customer tablosu ile rental tablosunda bulunan rental_id ile customer tablosundaki first_name ve last_name isimlerini 
birlikte görebileceğimiz FULL JOIN sorgusunu yazınız.

*/
--1.Soru
SELECT city,country FROM city
LEFT JOIN country ON city.country_id = country.country_id; 

--2.Soru
SELECT first_name,last_name,payment_id FROM customer
RIGHT JOIN payment ON customer.customer_id = payment.customer_id; 

--3.Soru
Select first_name,last_name,rental_id from customer
FULL JOIN rental ON customer.customer_id = rental.customer_id;

/*
Ödev11
1-actor ve customer tablolarında bulunan first_name sütunları için tüm verileri sıralayalım.
2-actor ve customer tablolarında bulunan first_name sütunları için kesişen verileri sıralayalım.
3-actor ve customer tablolarında bulunan first_name sütunları için ilk tabloda bulunan ancak ikinci tabloda bulunmayan verileri sıralayalım.
4-İlk 3 sorguyu tekrar eden veriler için de yapalım.

*/

--1.Soru

(
    SELECT first_name FROM actor
    
)
UNION
(
    SELECT first_name FROM customer
    
)
ORDER BY first_name;

--2.Soru
(
    SELECT first_name FROM actor
    
)
INTERSECT
(
    SELECT first_name FROM customer
    
)
ORDER BY first_name;

--3.Soru
(
    SELECT first_name FROM actor
    
)
EXCEPT 
(
    SELECT first_name FROM customer
    
)
ORDER BY first_name;

--4.Soru
    --1.Madde
    (
    SELECT first_name FROM actor
    
    )
    UNION ALL
    (
    SELECT first_name FROM customer
    
    )
    ORDER BY first_name;
    --2.Madde
    (
    SELECT first_name FROM actor
    
    )
    INTERSECT
    (
        SELECT first_name FROM customer
        
    )
    ORDER BY first_name;
    --3.Madde
    (
    SELECT first_name FROM actor
    
    )
    EXCEPT ALL
    (
        SELECT first_name FROM customer
        
    )
    ORDER BY first_name;

/*
Ödev12
1-film tablosunda film uzunluğu length sütununda gösterilmektedir. Uzunluğu ortalama film uzunluğundan fazla kaç tane
film vardır?
2-film tablosunda en yüksek rental_rate değerine sahip kaç tane film vardır?
3-film tablosunda en düşük rental_rate ve en düşün replacement_cost değerlerine sahip filmleri sıralayınız.
4-payment tablosunda en fazla sayıda alışveriş yapan müşterileri(customer) sıralayınız.

*/

--1.Soru
SELECT COUNT(length) FROM film
WHERE length >
(SELECT AVG(length) FROM film);

--2.Soru
SELECT COUNT(rental_rate) FROM film
WHERE rental_rate = 
(SELECT MAX(rental_rate) FROM film);

--3.Soru
SELECT rental_rate,replacement_cost FROM film
WHERE rental_rate =
(SELECT MIN(rental_rate) FROM film
) 
AND 
replacement_cost = 
(SELECT MIN(replacement_cost) FROM film
) 

--4.Soru
SELECT DISTINCT customer_id ,
(SELECT Count(*) FROM payment WHERE customer_id = main_payment.customer_id ) AS payment_count
FROM payment AS main_payment 
ORDER BY payment_count DESC
LIMIT 10;

