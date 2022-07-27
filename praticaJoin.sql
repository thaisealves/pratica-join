--Exercício 1 
SELECT users.id, users.name AS name, cities.name AS "city" FROM users JOIN cities ON users."cityId" = cities.id WHERE cities.name = 'Rio de Janeiro';

-- Exercicio 2
SELECT t.id, users.name AS writer, u.name AS recipient , t.message
FROM testimonials t JOIN users ON t."writerId" = users.id 
JOIN users u ON t."recipientId" = u.id;

--Exercício 3
SELECT users.id AS id, users.name AS name, courses.name AS course,  schools.name AS school,
educations."endDate" FROM educations 
JOIN courses ON educations."courseId" = courses.id
JOIN users ON educations."userId" = users.id
JOIN schools ON educations."schoolId" = schools.id
WHERE educations.status = 'finished' AND users.id = 30;

--Exercício 4
SELECT users.id AS id, users.name AS name, roles.name AS role, companies.name AS company,
e."startDate" FROM experiences e
JOIN users ON users.id = e."userId"
JOIN companies ON companies.id = e."companyId"
JOIN roles ON roles.id = e."roleId"
WHERE e."endDate" IS NULL AND users.id = 50;

--Bônus 
SELECT schools.id, schools.name AS school, courses.name AS course,
companies.name AS company, roles.name AS role 
FROM educations e
JOIN schools ON e."schoolId" = schools.id
JOIN courses ON e."courseId" = courses.id
JOIN applicants a ON a."userId" = e."userId"
JOIN jobs ON a."jobId" = jobs.id
JOIN companies ON companies.id = jobs."companyId" 
JOIN roles ON jobs."roleId" = roles.id
WHERE companies.id = 10 AND roles.name = 'Software Engineer' AND jobs.active IS TRUE;