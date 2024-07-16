 club_member_info definition

--CREATE TABLE club_member_info_clean (
--	full_name VARCHAR(50),
--	age INTEGER,
--	martial_status VARCHAR(50),
--	email VARCHAR(50),
--	phone VARCHAR(50),
--	full_address VARCHAR(50),
--	job_title VARCHAR(50),
--	membership_date VARCHAR(50)
--);

--INSERT INTO club_member_info_clean
--SELECT * FROM club_member_info;

--select * from club_member_info_clean limit 10
 
-- UPDATE club_member_info_clean
--    SET full_name=TRIM(UPPER(full_name))
 
--SELECT DISTINCT martial_status FROM club_member_info_clean

-- UPDATE club_member_info_clean
--  SET martial_status = CASE
--	WHEN martial_status = '' THEN NULL
--	WHEN martial_status = 'divored' THEN 'divorced'
--	ELSE martial_status 
--  END
 
--SELECT COUNT(*) FROM club_member_info_clean WHERE email = ''

--UPDATE club_member_info_clean
--SET email=TRIM(email)
 
--SELECT min(age) FROM club_member_info_clean 
--SELECT * FROM club_member_info_clean WHERE age>90 LIMIT 5
 
--UPDATE club_member_info_clean 
--SET age = CASE
-- WHEN age ='' OR age>90 THEN NULL
-- ELSE age
--END 
 
--UPDATE club_member_info_clean
--SET email=TRIM(email)
 
-- UPDATE club_member_info_clean 
-- SET phone = CASE
--  WHEN phone ='' THEN NULL 
--  ELSE trim(phone) 
--END
 
-- UPDATE club_member_info_clean 
--SET full_address = CASE
--  WHEN full_address ='' THEN NULL 
--  ELSE trim(lower(full_address))
--END
 
-- UPDATE club_member_info_clean 
--SET job_title = CASE
--  WHEN job_title ='' THEN NULL 
--  ELSE trim(lower(job_title))
--END
 
-- UPDATE club_member_info_clean
--SET membership_date = CASE
--  WHEN membership_date ='' THEN NULL 
--  ELSE trim(lower(membership_date))
--END
 select * from club_member_info_clean limit 10