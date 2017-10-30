SELECT
 STABBR as State,
SUM(EFDETOT) as Total_Distance,
SUM(EFDEEXC) as Exclusive_Distance,
SUM(EFDESOM) as Some_Distance,
SUM(EFDENON) as None_Distance

FROM hd2012 LEFT JOIN ef2012a_dist_rv
ON hd2012.UNITID = ef2012a_dist_rv.UNITID
GROUP BY STABBR;