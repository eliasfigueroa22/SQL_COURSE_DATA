/* Answer: What are the most optimal skills to learn (aka it’s in high demand and a high-paying skill) 
for a data analyst?
- Identify skills in high demand and associated with high average salaries for Data Analyst roles
- Concentrates on remote positions with specified salaries
- Why? Targets skills that offer job security (high demand) and financial benefits (high salaries), 
offering strategic insights for career development in data analysis */

WITH top_demanded_skills AS (
    SELECT
        skills_job_dim.skill_id,
        COUNT (skills_job_dim.job_id) AS demand_count
    FROM
        skills_job_dim
    INNER JOIN job_postings_fact ON job_postings_fact.job_id = skills_job_dim.job_id
    WHERE
        job_title_short = 'Data Analyst' AND
        salary_year_avg IS NOT NULL AND
        job_work_from_home IS TRUE
    GROUP BY
        skill_id
),


top_paying_skills AS (
    SELECT
        skills_job_dim.skill_id,
        AVG (job_postings_fact.salary_year_avg) AS avg_salary_skill
    FROM
        skills_job_dim
    INNER JOIN job_postings_fact ON job_postings_fact.job_id = skills_job_dim.job_id
    WHERE
        job_title_short = 'Data Analyst' AND
        salary_year_avg IS NOT NULL AND
        job_work_from_home IS TRUE
    GROUP BY
        skills_job_dim.skill_id
)


SELECT
    skills_dim.skills,
    top_demanded_skills.demand_count,
    ROUND (top_paying_skills.avg_salary_skill,0) AS avg_salary
FROM top_demanded_skills
INNER JOIN top_paying_skills ON top_paying_skills.skill_id = top_demanded_skills.skill_id
INNER JOIN skills_dim ON top_paying_skills.skill_id = skills_dim.skill_id
WHERE
    demand_count > 10
ORDER BY
    top_demanded_skills.demand_count DESC,
    avg_salary DESC
LIMIT 10


