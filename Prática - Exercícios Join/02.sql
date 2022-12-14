SELECT t.id, u.name as "writer", u2.name as "recipient", t.message
FROM testimonials t
JOIN users u ON u.id = t."writerId"
JOIN users u2 ON u2.id = t."recipientId";