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
HAVING
    COUNT(jpf.job_id) > 10
ORDER BY
    avg_salary DESC,
    demand_count DESC
LIMIT
    10;