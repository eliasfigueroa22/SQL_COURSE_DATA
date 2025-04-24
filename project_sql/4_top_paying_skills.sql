/* What are the top paying skills for 'Data Analyst'?
- Look at the average salary associated with each skill for Data Analyst positions.
- Focuses on roles with specified salaries, regardless of location.
- Why? It reveals how different skills impact salary levels for Data Analysts and helps 
identify the most financially rewarding skills to acquire or improve. */


SELECT
    skills,
    ROUND (AVG (job_postings_fact.salary_year_avg), 0) AS avg_salary_skill
FROM
    skills_job_dim
INNER JOIN skills_dim ON skills_dim.skill_id = skills_job_dim.skill_id
INNER JOIN job_postings_fact ON job_postings_fact.job_id = skills_job_dim.job_id
WHERE
    job_title_short = 'Data Analyst' AND
    salary_year_avg IS NOT NULL
GROUP BY
    skills
ORDER BY
    avg_salary_skill DESC
LIMIT 25;