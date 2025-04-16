SELECT
    skills,
    COUNT(jpf.job_id) AS demand_count,
    ROUND(AVG(salary_year_avg)) AS avg_salary
FROM
    job_postings_fact jpf
    JOIN skills_job_dim sjd USING (job_id)
    JOIN skills_dim sd USING (skill_id)
WHERE
    job_title_short = 'Data Analyst'
    AND salary_year_avg IS NOT NULL
    AND job_work_from_home = TRUE
GROUP BY
    skills
ORDER BY
    demand_count DESC, avg_salary DESC
LIMIT
    5;