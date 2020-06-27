
-- Query 1 --
select DISTINCT ALBUMTITLE, ALBUMRELEASEDATE, ALBUMPRICE from albums a, table(a.ALBUMARTISTS) c
where 
ALBUMRELEASEDATE  > '1-Jan-2015' and 
c.artistName = 'Neil Young' 
/
-- Query 2 ---
select DISTINCT albumtitle, c.artistname from albums a, table(a.ALBUMARTISTS) c
where value(a) IS OF (MP3_TYPE)
AND 
albumtitle not IN (
select DISTINCT albumtitle
--,c.artistname 
from albums a
--, table(a.ALBUMARTISTS) c
where value(a) IS OF (disk_type)
)
order by ALBUMTITLE
/
-- Query 3 --

with abc as     (
                select albumTitle, avg(c.reviewScore) as averageScore from albums a, (table(a.ALBUMREVIEWS)) c
                where value(a) IS OF (MP3_TYPE) 
                having count(c.reviewScore) > 1
                group by albumTitle
                )
select * from abc
where averageScore = (select min(averageScore) from abc)
/
--- Query 4 ---
select albumtitle from albums a
where value(a) IS OF (DISK_TYPE)
INTERSECT
select albumtitle from albums a
where value(a) IS OF (MP3_TYPE)
order by albumtitle
/
-- Q5 answer is implemented in the member function section from line 79---


-- View for Q6 and Q7
create or replace view all_albums (albumTitle, albumType, albumPrice, discount, albumUsedPrice) as
    select a.albumTitle, coalesce(treat(value(a) as Disk_Type).MediaType,'MP3'), 
    albumPrice, (albumPrice-a.discountPrice()), 
    coalesce(treat(value(a) as Disk_Type).diskUsedPrice , 0)
    from albums a;
/
-- Q6 Select the largest discount
select * from all_albums
where discount = (select max(discount) from all_albums)
/
--- Q7 Select the largest usedPrice
select * from all_albums
where albumUsedPrice = (select max(albumUsedPrice) from all_albums)
/
-- Q8 Select AlbumTitle, ReviewScore that has word great
select DISTINCT albumTitle,  c.reviewText, c.reviewScore from albums a, table(a.ALBUMREVIEWS) c
where a.containsText(c.ReviewText, 'great') > 0
/