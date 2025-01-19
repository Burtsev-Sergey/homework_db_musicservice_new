-- ЗАДАНИЕ 2
-- Вывод названия и продолжительности самого длительного трека.
select track_name, sound_time from Track
order by sound_time desc
limit 1;

-- Вывод названий треков, продолжительность которых не менее 3,5 минут.
select track_name, sound_time from Track
where sound_time >= 210;

-- Вывод названия сборников, вышедших в период с 2018 по 2020 год включительно.
select collection_name from Collection
where year_release between 2018 and 2020;

-- Вывод исполнителей, чьё имя состоит из одного слова.
select name from Singer
where name not like '% %';

-- вывод названий треков, которые содержат слово «мой».
select track_name from Track
where track_name ilike 'мой %' -- мой в начале строки
or track_name ilike '% мой' -- мой в конце строки
or track_name ilike '% мой %' -- мой в середине строки
or track_name ilike 'мой' -- из одного слова мой
;

-- вывод названий треков, которые содержат слово «my».
select track_name from Track
where track_name ilike 'my %' -- my в начале строки
or track_name ilike '% my' -- my в конце строки
or track_name ilike '% my %' -- my в середине строки
or track_name ilike 'my' -- из одного слова my
;

-- ЗАДАНИЕ 3
-- Вывод количества исполнителей в каждом жанре
SELECT g.genre, COUNT(gs.singer_id) AS singer_count FROM genre g 
LEFT JOIN genre_singer gs ON g.id = gs.genre_id 
LEFT JOIN singer s ON gs.singer_id = s.id 
GROUP BY g.id 
ORDER BY g.genre; 

-- Вывод количества треков, вошедших в альбомы 2019–2020 годов.
SELECT COUNT(t.id) AS track_count FROM album AS a
LEFT JOIN track AS t ON a.id = t.album_id
WHERE a.year_release BETWEEN '2019' AND '2020';

-- Вывод средней продолжительности треков по каждому альбому.
SELECT a.album AS album_name, AVG(t.sound_time) AS average_duration FROM album a
LEFT JOIN track t ON a.id = t.album_id
GROUP BY a.id, a.album
ORDER BY a.album;

-- Вывод всех исполнителей, которые не выпустили альбомы в 2020 году.
SELECT DISTINCT s.name  FROM singer s 
WHERE s.id NOT IN (
SELECT asp.singer_id FROM album_singer asp 
JOIN album a ON asp.album_id = a.id 
WHERE a.year_release BETWEEN '2020' AND '2020'
);

-- Вывод названий сборников, в которых присутствует исполнитель Валерий Кипелов.
SELECT DISTINCT c.collection_name FROM collection c
JOIN collection_track ct ON c.id = ct.collection_id
JOIN track t ON ct.track_id = t.id
JOIN album a ON t.album_id = a.id
JOIN album_singer asp ON a.id = asp.album_id
JOIN singer s ON asp.singer_id = s.id
WHERE s.name = 'Валерий Кипелов';

