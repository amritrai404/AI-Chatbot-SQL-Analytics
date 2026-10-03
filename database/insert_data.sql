USE AI_Chatbot_Analytics;

-- Insert subscription plans
INSERT INTO plans (plan_name, price)
VALUES
('Free', 0.00),
('Premium', 19.99);


-- Insert users
INSERT INTO users (name, email, plan_id)
VALUES
('Rahul Sharma', 'rahul@example.com', 1),
('Aman Verma', 'aman@example.com', 2),
('Priya Singh', 'priya@example.com', 1),
('Neha Gupta', 'neha@example.com', 2),
('Arjun Patel', 'arjun@example.com', 1),
('Sneha Mehta', 'sneha@example.com', 2),
('Rohan Kumar', 'rohan@example.com', 1),
('Anjali Singh', 'anjali@example.com', 2),
('Vikash Yadav', 'vikash@example.com', 1),
('Pooja Sharma', 'pooja@example.com', 2);


-- Insert AI models
INSERT INTO models (model_name, model_type)
VALUES
('GPT-4o', 'LLM'),
('Claude 3.5 Sonnet', 'LLM'),
('Gemini 1.5 Pro', 'LLM');


-- Insert conversations
INSERT INTO conversations (user_id, model_id, created_at)
VALUES
(1, 1, '2026-09-20 10:15:00'),
(1, 2, '2026-09-21 14:30:00'),
(2, 1, '2026-09-22 09:45:00'),
(3, 3, '2026-09-22 16:20:00'),
(3, 1, '2026-09-23 11:10:00'),
(4, 2, '2026-09-24 13:05:00'),
(5, 1, '2026-09-25 18:40:00'),
(6, 3, '2026-09-26 10:30:00'),
(7, 2, '2026-09-27 15:15:00'),
(8, 1, '2026-09-28 12:00:00');


-- Insert messages
INSERT INTO messages (conversation_id, sender, message)
VALUES
(1, 'user', 'Hello, I need help with SQL.'),
(1, 'AI', 'Sure! I can help you with SQL.'),

(2, 'user', 'Explain database normalization.'),
(2, 'AI', 'Database normalization organizes data to reduce redundancy.'),

(3, 'user', 'What is a primary key?'),
(3, 'AI', 'A primary key uniquely identifies each row in a table.'),

(4, 'user', 'What is machine learning?'),
(4, 'AI', 'Machine learning allows systems to learn patterns from data.'),
(4, 'user', 'Can you give me an example?'),
(4, 'AI', 'Spam email detection is a common example.'),

(5, 'user', 'Explain SQL joins.'),
(5, 'AI', 'SQL joins combine related data from multiple tables.'),

(6, 'user', 'What is an API?'),
(6, 'AI', 'An API allows different software systems to communicate.'),
(6, 'user', 'Where are APIs used?'),
(6, 'AI', 'APIs are widely used in web and mobile applications.'),

(7, 'user', 'What is Python?'),
(7, 'AI', 'Python is a popular general-purpose programming language.'),

(8, 'user', 'Explain artificial intelligence.'),
(8, 'AI', 'Artificial intelligence enables machines to perform tasks that normally require human intelligence.'),
(8, 'user', 'Give me some AI examples.'),
(8, 'AI', 'Chatbots, recommendation systems, and computer vision are examples.'),

(9, 'user', 'What is data analysis?'),
(9, 'AI', 'Data analysis involves examining data to discover useful insights.'),

(10, 'user', 'What is SQL used for?'),
(10, 'AI', 'SQL is used to store, retrieve, and analyze data in relational databases.'),
(10, 'user', 'Is SQL important for data analytics?'),
(10, 'AI', 'Yes, SQL is widely used for querying and analyzing structured data.');
