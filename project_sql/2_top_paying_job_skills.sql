SELECT
    jpf.job_id,
    job_title,
    salary_year_avg,
    name AS company_name,
    skills
FROM
    job_postings_fact jpf
    LEFT JOIN company_dim cd USING (company_id)
    JOIN skills_job_dim sjd USING (job_id)
    JOIN skills_dim sd USING (skill_id)
WHERE
    jpf.job_id IN (
        SELECT
            job_id
        FROM
            job_postings_fact
        WHERE
            salary_year_avg IS NOT NULL
            AND job_title_short = 'Data Analyst'
            AND job_location = 'Anywhere'
        ORDER BY
            salary_year_avg DESC
        LIMIT
            10
    )
ORDER BY
    salary_year_avg DESC;