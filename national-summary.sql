SELECT
SUM(EFDETOT) as Total_Distance,
SUM(EFDESOM) as Some_Distance,
SUM(EFDEEXC) as Exclusive_Distance, 
SUM(EFDENON) as None_Distance,
EFDELEV as Level
FROM ipeds.ef2012a_dist_rv
GROUP BY EFDELEV;
-- 
-- SELECT
-- SUM(EFDETOT) as Total_Distance,
-- SUM(EFDESOM) as Some_Distance,
-- SUM(EFDEEXC) as Exclusive_Distance, 
-- SUM(EFDENON) as None_Distance,
-- EFDELEV as Level
-- FROM ipeds.ef2013a_dist_rv
-- GROUP BY EFDELEV;
-- 
-- SELECT
-- SUM(EFDETOT) as Total_Distance,
-- SUM(EFDESOM) as Some_Distance,
-- SUM(EFDEEXC) as Exclusive_Distance, 
-- SUM(EFDENON) as None_Distance,
-- EFDELEV as Level
-- FROM ipeds.ef2014a_dist_rv
-- GROUP BY EFDELEV;
-- 
-- SELECT
-- SUM(EFDETOT) as Total_Distance,
-- SUM(EFDESOM) as Some_Distance,
-- SUM(EFDEEXC) as Exclusive_Distance, 
-- SUM(EFDENON) as None_Distance,
-- EFDELEV as Level
-- FROM ipeds.ef2015a_dist
-- GROUP BY EFDELEV;
