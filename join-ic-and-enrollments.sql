SELECT
 hd2012.UNITID as ID,
 STABBR as State,
 INSTNM as Institution_Name,
 EFDELEV as Enrollment_Level,
 ICLEVEL as Institution_Level,
 CONTROL as Control,
 EFDETOT as Total_Distance,
 EFDEEXC as Exclusive_Distance,
 EFDESOM as Some_Distance,
 EFDENON as None_Distance,
 EFDEEX1 as InState_Students,
 EFDEEX2 as OutOfState_Students,
 EFDEEX3 as US_Location_Unknown_Students,
 EFDEEX4 as International_Students,
 EFDEEX5 as Location_Unknown_Students


 FROM hd2012 LEFT JOIN ef2012a_dist_rv
 ON hd2012.UNITID = ef2012a_dist_rv.UNITID;


--  SELECT
--  hd2013.UNITID as ID,
--  STABBR as State,
--  INSTNM as Institution_Name,
--  EFDELEV as Enrollment_Level,
--  ICLEVEL as Institution_Level,
--  CONTROL as Control,
--  EFDETOT as Total_Distance,
--  EFDEEXC as Exclusive_Distance,
--  EFDESOM as Some_Distance,
--  EFDENON as None_Distance,
--  EFDEEX1 as InState_Students,
--  EFDEEX2 as OutOfState_Students,
--  EFDEEX3 as US_Location_Unknown_Students,
--  EFDEEX4 as International_Students,
--  EFDEEX5 as Location_Unknown_Students
--
--  FROM hd2013 LEFT JOIN ef2013a_dist_rv
--  ON hd2013.UNITID = ef2013a_dist_rv.UNITID;

--  SELECT
--  hd2014.UNITID as ID,
--  STABBR as State,
--  INSTNM as Institution_Name,
--  EFDELEV as Enrollment_Level,
--  ICLEVEL as Institution_Level,
--  CONTROL as Control,
--  EFDETOT as Total_Distance,
--  EFDEEXC as Exclusive_Distance,
--  EFDESOM as Some_Distance,
--  EFDENON as None_Distance,
--  EFDEEX1 as InState_Students,
--  EFDEEX2 as OutOfState_Students,
--  EFDEEX3 as US_Location_Unknown_Students,
--  EFDEEX4 as International_Students,
--  EFDEEX5 as Location_Unknown_Students
--
--  FROM hd2014 LEFT JOIN ef2014a_dist_rv
--  ON hd2014.UNITID = ef2014a_dist_rv.UNITID;
--
--  SELECT
--  hd2015.UNITID as ID,
--  STABBR as State,
--  INSTNM as Institution_Name,
--  EFDELEV as Enrollment_Level,
--  ICLEVEL as Institution_Level,
--  CONTROL as Control,
--  EFDETOT as Total_Distance,
--  EFDEEXC as Exclusive_Distance,
--  EFDESOM as Some_Distance,
--  EFDENON as None_Distance,
--  EFDEEX1 as InState_Students,
--  EFDEEX2 as OutOfState_Students,
--  EFDEEX3 as US_Location_Unknown_Students,
--  EFDEEX4 as International_Students,
--  EFDEEX5 as Location_Unknown_Students
--
--  FROM hd2015 LEFT JOIN ef2015a_dist
--  ON hd2015.UNITID = ef2015a_dist.UNITID;

--  SELECT
--  hd2016.UNITID as ID,
--  STABBR as State,
--  INSTNM as Institution_Name,
--  EFDELEV as Enrollment_Level,
--  ICLEVEL as Institution_Level,
--  CONTROL as Control,
--  EFDETOT as Total_Distance,
--  EFDEEXC as Exclusive_Distance,
--  EFDESOM as Some_Distance,
--  EFDENON as None_Distance,
--  EFDEEX1 as InState_Students,
--  EFDEEX2 as OutOfState_Students,
--  EFDEEX3 as US_Location_Unknown_Students,
--  EFDEEX4 as International_Students,
--  EFDEEX5 as Location_Unknown_Students

--  FROM hd2016 LEFT JOIN ef2016a_dist
--  ON hd2016.UNITID = ef2016a_dist.UNITID;

