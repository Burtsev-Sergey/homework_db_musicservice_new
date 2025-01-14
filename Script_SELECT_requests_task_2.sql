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