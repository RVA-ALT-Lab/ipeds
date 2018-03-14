SELECT * FROM ncsara20162017enrollments 
WHERE ncsara20162017enrollments.Name NOT IN 
	(
	SELECT Name FROM ncsara20162017enrollments JOIN hd2016 
	ON 
    REPLACE(ncsara20162017enrollments.Name, ' ', '') 
    = 
    REPLACE(hd2016.INSTNM, ' ', '') 
	AND ncsara20162017enrollments.State = hd2016.STABBR
	)


-- SELECT * FROM ncsara20162017enrollments JOIN hd2016 ON 
--     REPLACE(ncsara20162017enrollments.Name, ' ', '') 
--     = 
--     REPLACE(hd2016.INSTNM, ' ', '') 
--     AND ncsara20162017enrollments.State = hd2016.STABBR