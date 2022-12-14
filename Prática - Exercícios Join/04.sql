SELECT u.id, u.name, r.name as "role", c.name as "company", e."startDate"
FROM experiences e
JOIN users u ON u.id = e."userId"
JOIN companies c ON c.id = e."companyId"
JOIN roles r ON r.id = e."roleId"
WHERE u.id = 50 AND  e."endDate" IS NULL;