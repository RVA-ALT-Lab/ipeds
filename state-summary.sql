SELECT
 STABBR as State,
 EFDETOT as Total_Distance,
 EFDEEXC as Exclusive_Distance,
 EFDESOM as Some_Distance,
 EFDENON as None_Distance

 FROM hd2012 LEFT JOIN ef2012a_dist_rv
 ON hd2012.UNITID = ef2012a_dist_rv.UNITID;