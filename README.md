# SQL-data-cleaning
This is an educational project on data cleaning and preparation using SQL. The original database in CSV format is located in the file club_member_info.csv. Here, we will explore the steps that need to be applied to obtain a cleansed version of the dataset.

|full_name|age|martial_status|email|phone|full_address|job_title|membership_date|
|---------|---|--------------|-----|-----|------------|---------|---------------|
|addie lush|40|married|alush0@shutterfly.com|254-389-8708|3226 Eastlawn Pass,Temple,Texas|Assistant Professor|7/31/2013|
|      ROCK CRADICK|46|married|rcradick1@newsvine.com|910-566-2007|4 Harbort Avenue,Fayetteville,North Carolina|Programmer III|5/27/2018|
|Sydel Sharvell|46|divorced|ssharvell2@amazon.co.jp|702-187-8715|4 School Place,Las Vegas,Nevada|Budget/Accounting Analyst I|10/6/2017|
|Constantin de la cruz|35||co3@bloglines.com|402-688-7162|6 Monument Crossing,Omaha,Nebraska|Desktop Support Technician|10/20/2015|
|  Gaylor Redhole|38|married|gredhole4@japanpost.jp|917-394-6001|88 Cherokee Pass,New York City,New York|Legal Assistant|5/29/2019|
|Wanda del mar       |44|single|wkunzel5@slideshare.net|937-467-6942|10864 Buhler Plaza,Hamilton,Ohio|Human Resources Assistant IV|3/24/2015|
|Joann Kenealy|41|married|jkenealy6@bloomberg.com|513-726-9885|733 Hagan Parkway,Cincinnati,Ohio|Accountant IV|4/17/2013|
|   Joete Cudiff|51|divorced|jcudiff7@ycombinator.com|616-617-0965|975 Dwight Plaza,Grand Rapids,Michigan|Research Nurse|11/16/2014|
|mendie alexandrescu|46|single|malexandrescu8@state.gov|504-918-4753|34 Delladonna Terrace,New Orleans,Louisiana|Systems Administrator III|3/12/1921|
| fey kloss|52|married|fkloss9@godaddy.com|808-177-0318|8976 Jackson Park,Honolulu,Hawaii|Chemical Engineer|11/5/2014|

### Copy the table
```sql
     CREATE TABLE club_member_info_clean (
	    full_name VARCHAR(50),
	    age INTEGER,
	    martial_status VARCHAR(50),
	    email VARCHAR(50),
	    phone VARCHAR(50),
	    full_address VARCHAR(50),
	    job_title VARCHAR(50),
	    membership_date VARCHAR(50)
      );
```

### Copy all values from original table
```sql
     INSERT INTO club_member_info_clean
        SELECT * FROM club_member_info;
```


### Trim and upper column full_name
 ```sql
    UPDATE club_member_info_clean
     SET full_name=TRIM(UPPER(full_name))
```   

## CHECK VALUES IN EACH COLUMNS & CLEANING

### Martial Status
```sql
SELECT DISTINCT martial_status FROM club_member_info_clean
```
#### Result
|martial_status|
|--------------|
|married|
|divorced|
||
|single|
|divored|

There are wrong values due to typos, let's correct it and set empty values to NULL values.
```sql
  UPDATE club_member_info_clean 
  SET martial_status = CASE
	WHEN martial_status = '' THEN NULL
	WHEN martial_status = 'divored' THEN 'divorced'
	ELSE martial_status 
  END
```

### Age
Check age range
```sql
SELECT min(age) FROM club_member_info_clean
```

```sql
SELECT * FROM club_member_info_clean WHERE age>90 limit 5
```

#### Result
|min(age)|
|--------|
|18|

|full_name|age|martial_status|email|phone|full_address|job_title|membership_date|
|---------|---|--------------|-----|-----|------------|---------|---------------|
|JORI SANZ|399|married|jsanz3i@google.cn|904-906-7537|99 West Crossing,Jacksonville,Florida|Professor|2/15/2012|
|CARLYE GRAEBER|555|married|cgraeber6n@quantcast.com|214-345-1363|8 Dexter Junction,Dallas,Texas|Actuary|3/10/2021|
|SHURWOOD STRUTLEY|544|married|sstrutley9w@craigslist.org|804-636-0234|7779 Main Road,Richmond,Virginia|Nuclear Power Engineer|6/30/2014|
|CORBIN HILLAN|499|single|chillandg@time.com|267-229-4017|78 La Follette Trail,Philadelphia,Pennsylvania|Account Representative II|7/7/2021|
|SMITTY BULMER|522|divorced|sbulmergm@addthis.com||23370 Forest Dale Street,Pittsburgh,Pennsylvania|VP Marketing|9/25/2017|

Some values are empty or out of range, let's put them to NULL.
```sql
UPDATE club_member_info_clean 
SET age = CASE
WHEN age ='' OR age>90 THEN NULL
ELSE age
END
```

### Email
Let's check empty values and trim.

```sql
SELECT COUNT(*) FROM club_member_info_clean WHERE email = ''
```
```sql
UPDATE club_member_info_clean
SET email=TRIM(email)
```

### Other columns
Let's do the same steps with other columns: check the empty values then replace them with NULL, remove whitecases with TRIM, correct the LETTERCASE inconsistency. 

```sql
UPDATE club_member_info_clean 
SET phone = CASE
  WHEN phone ='' THEN NULL 
  ELSE trim(phone) 
END
```

```sql
UPDATE club_member_info_clean 
SET full_address = CASE
  WHEN full_address ='' THEN NULL 
  ELSE trim(lower(full_address))
END
```

```sql
UPDATE club_member_info_clean 
SET job_title = CASE
  WHEN job_title ='' THEN NULL 
  ELSE trim(lower(job_title))
END
```

```sql
UPDATE club_member_info_clean
SET membership_date = CASE
  WHEN membership_date ='' THEN NULL 
  ELSE trim(lower(membership_date))
END
```

# RESULTS after cleaning 

```sql
select * from club_member_info_clean limit 10
```

|full_name|age|martial_status|email|phone|full_address|job_title|membership_date|
|---------|---|--------------|-----|-----|------------|---------|---------------|
|ADDIE LUSH|40|married|alush0@shutterfly.com|254-389-8708|3226 eastlawn pass,temple,texas|assistant professor|7/31/2013|
|ROCK CRADICK|46|married|rcradick1@newsvine.com|910-566-2007|4 harbort avenue,fayetteville,north carolina|programmer iii|5/27/2018|
|SYDEL SHARVELL|46|divorced|ssharvell2@amazon.co.jp|702-187-8715|4 school place,las vegas,nevada|budget/accounting analyst i|10/6/2017|
|CONSTANTIN DE LA CRUZ|35||co3@bloglines.com|402-688-7162|6 monument crossing,omaha,nebraska|desktop support technician|10/20/2015|
|GAYLOR REDHOLE|38|married|gredhole4@japanpost.jp|917-394-6001|88 cherokee pass,new york city,new york|legal assistant|5/29/2019|
|WANDA DEL MAR|44|single|wkunzel5@slideshare.net|937-467-6942|10864 buhler plaza,hamilton,ohio|human resources assistant iv|3/24/2015|
|JOANN KENEALY|41|married|jkenealy6@bloomberg.com|513-726-9885|733 hagan parkway,cincinnati,ohio|accountant iv|4/17/2013|
|JOETE CUDIFF|51|divorced|jcudiff7@ycombinator.com|616-617-0965|975 dwight plaza,grand rapids,michigan|research nurse|11/16/2014|
|MENDIE ALEXANDRESCU|46|single|malexandrescu8@state.gov|504-918-4753|34 delladonna terrace,new orleans,louisiana|systems administrator iii|3/12/1921|
|FEY KLOSS|52|married|fkloss9@godaddy.com|808-177-0318|8976 jackson park,honolulu,hawaii|chemical engineer|11/5/2014|







