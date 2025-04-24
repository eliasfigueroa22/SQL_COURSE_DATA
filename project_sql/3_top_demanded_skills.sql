/*Question: What are the 10 skills most in-demand for data analysts*/

-- Top 10 skills in-demand arround the world

SELECT
    skills,
    COUNT (skills_job_dim.job_id) AS demand_count
FROM
    skills_job_dim
INNER JOIN skills_dim ON skills_dim.skill_id = skills_job_dim.skill_id
INNER JOIN job_postings_fact ON job_postings_fact.job_id = skills_job_dim.job_id
WHERE
    job_title_short = 'Data Analyst'
GROUP BY
    skills
ORDER BY
    demand_count DESC
LIMIT 10;




-- Top 10 skills in-demand in "Remote jobs from countries of interest to me"

SELECT
    skills,
    COUNT (skills_job_dim.job_id) AS demand_count
FROM
    skills_job_dim
INNER JOIN skills_dim ON skills_dim.skill_id = skills_job_dim.skill_id
INNER JOIN job_postings_fact ON job_postings_fact.job_id = skills_job_dim.job_id
WHERE
    job_title_short = 'Data Analyst' AND
    job_country IN  ('Brazil','Argentina','Chile','Uruguay') AND
    job_work_from_home IS TRUE
GROUP BY
    skills
ORDER BY
    demand_count DESC
LIMIT 10