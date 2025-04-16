SELECT
    skills,
    ROUND(AVG(salary_year_avg)) AS avg_salary
FROM
    job_postings_fact
    JOIN skills_job_dim sjd USING (job_id)
    JOIN skills_dim sd USING (skill_id)
WHERE
    job_title_short = 'Data Analyst'
    AND salary_year_avg IS NOT NULL
GROUP BY
    skills
ORDER BY
    avg_salary DESC
LIMIT
    25;