-- What are the top-paying jobs for my role?

--Top 10 highest paying data analyst roles (remote)

SELECT
    job_id,
    job_title,
    job_country,
    job_location,
    job_schedule_type,
    salary_year_avg,
    name AS company_name,
    job_posted_date
FROM 
    job_postings_fact
LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
WHERE
    job_title_short = 'Data Analyst' AND
    job_location = 'Anywhere' AND
    salary_year_avg IS NOT NULL 
ORDER BY
    salary_year_avg DESC
LIMIT 10;




--Remote jobs from countries of interest to me

SELECT
    job_id,
    job_title,
    job_country,
    job_location,
    job_work_from_home,
    job_schedule_type,
    salary_year_avg,
    name AS company_name,
    job_posted_date
FROM job_postings_fact
LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
WHERE
    job_country IN  ('Brazil','Argentina','Chile','Uruguay') AND
    job_title_short = 'Data Analyst' AND
    job_work_from_home IS TRUE
ORDER BY
    job_country



--Remote and local jobs in my country

SELECT
    job_id,
    job_title,
    job_country,
    job_location,
    job_work_from_home,
    job_schedule_type,
    salary_year_avg,
    name AS company_name,
    job_posted_date
FROM job_postings_fact
LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
WHERE
    job_country = 'Paraguay' AND
    job_title_short = 'Data Analyst'


/*From "Remote and local jobs in my country" and "Remote jobs from countries of 
interest to me" theres no info from salary_year_avg, that is why I don't put 
a condition in WHERE to filter the salaryes/*



