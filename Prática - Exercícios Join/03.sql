SELECT u.id, u.name, c.name as "course", s.name as "school", e."endDate"
FROM educations e
JOIN users u ON u.id = e."userId"
JOIN schools s ON s.id = e."schoolId"
JOIN courses c ON c.id = e."courseId"
WHERE e.status = 'finished' AND u.id = 30;
