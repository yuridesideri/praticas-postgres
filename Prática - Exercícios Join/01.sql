SELECT u.id, u.name, c.name
FROM users as u
JOIN cities as c ON c.id = u."cityId";