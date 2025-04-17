SELECT
    skills,
    COUNT(jpf.job_id) AS demand_count
FROM
    job_postings_fact jpf
    JOIN skills_job_dim sjd USING (job_id)
    JOIN skills_dim sd USING (skill_id)
WHERE
    job_title_short = 'Data Analyst'
    AND job_work_from_home = TRUE
GROUP BY
    skills
ORDER BY
    demand_count DESC
LIMIT
    5;
