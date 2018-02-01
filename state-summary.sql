-- SELECT
-- STABBR as State,
-- EFDELEV as Level ,
-- SUM(EFDETOT) as Total_Distance,
-- SUM(EFDEEXC) as Exclusive_Distance,
-- SUM(EFDESOM) as Some_Distance,
-- SUM(EFDENON) as None_Distance,
-- SUM(EFDEEX1) as InState_Students,
-- SUM(EFDEEX2) as OutOfState_Students,
-- SUM(EFDEEX3) as US_Location_Unknown_Students,
-- SUM(EFDEEX4) as International_Students,
-- SUM(EFDEEX5) as Location_Unknown_Students
--
-- FROM hd2012 LEFT JOIN ef2012a_dist_rv
-- ON hd2012.UNITID = ef2012a_dist_rv.UNITID
-- GROUP BY State,  Level;

-- SELECT
-- STABBR as State,
-- EFDELEV as Level ,
-- SUM(EFDETOT) as Total_Distance,
-- SUM(EFDEEXC) as Exclusive_Distance,
-- SUM(EFDESOM) as Some_Distance,
-- SUM(EFDENON) as None_Distance,
-- SUM(EFDEEX1) as InState_Students,
-- SUM(EFDEEX2) as OutOfState_Students,
-- SUM(EFDEEX3) as US_Location_Unknown_Students,
-- SUM(EFDEEX4) as International_Students,
-- SUM(EFDEEX5) as Location_Unknown_Students
--
-- FROM hd2013 LEFT JOIN ef2013a_dist_rv
-- ON hd2013.UNITID = ef2013a_dist_rv.UNITID
-- GROUP BY State,  Level;

-- SELECT
-- STABBR as State,
-- EFDELEV as Level ,
-- SUM(EFDETOT) as Total_Distance,
-- SUM(EFDEEXC) as Exclusive_Distance,
-- SUM(EFDESOM) as Some_Distance,
-- SUM(EFDENON) as None_Distance,
-- SUM(EFDEEX1) as InState_Students,
-- SUM(EFDEEX2) as OutOfState_Students,
-- SUM(EFDEEX3) as US_Location_Unknown_Students,
-- SUM(EFDEEX4) as International_Students,
-- SUM(EFDEEX5) as Location_Unknown_Students
--
-- FROM hd2014 LEFT JOIN ef2014a_dist_rv
-- ON hd2014.UNITID = ef2014a_dist_rv.UNITID
-- GROUP BY State,  Level;

-- SELECT
-- STABBR as State,
-- EFDELEV as Level ,
-- SUM(EFDETOT) as Total_Distance,
-- SUM(EFDEEXC) as Exclusive_Distance,
-- SUM(EFDESOM) as Some_Distance,
-- SUM(EFDENON) as None_Distance,
-- SUM(EFDEEX1) as InState_Students,
-- SUM(EFDEEX2) as OutOfState_Students,
-- SUM(EFDEEX3) as US_Location_Unknown_Students,
-- SUM(EFDEEX4) as International_Students,
-- SUM(EFDEEX5) as Location_Unknown_Students

-- FROM hd2015 LEFT JOIN ef2015a_dist
-- ON hd2015.UNITID = ef2015a_dist.UNITID
-- GROUP BY State,  Level;


SELECT
STABBR as State,
EFDELEV as Level ,
SUM(EFDETOT) as Total_Distance,
SUM(EFDEEXC) as Exclusive_Distance,
SUM(EFDESOM) as Some_Distance,
SUM(EFDENON) as None_Distance,
SUM(EFDEEX1) as InState_Students,
SUM(EFDEEX2) as OutOfState_Students,
SUM(EFDEEX3) as US_Location_Unknown_Students,
SUM(EFDEEX4) as International_Students,
SUM(EFDEEX5) as Location_Unknown_Students

FROM hd2016 LEFT JOIN ef2016a_dist
ON hd2016.UNITID = ef2016a_dist.UNITID
GROUP BY State,  Level;