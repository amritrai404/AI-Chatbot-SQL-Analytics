USE AI_Chatbot_Analytics;


-- ============================================
-- 1. Total Users
-- ============================================

SELECT COUNT(*) AS total_users
FROM users;


-- ============================================
-- 2. Free vs Premium Users
-- ============================================

SELECT
    plans.plan_name,
    COUNT(users.user_id) AS total_users
FROM plans
LEFT JOIN users
    ON plans.plan_id = users.plan_id
GROUP BY plans.plan_id, plans.plan_name;


-- ============================================
-- 3. Users in Each Subscription Plan
-- ============================================

SELECT
    plans.plan_name,
    COUNT(users.user_id) AS total_users
FROM plans
LEFT JOIN users
    ON plans.plan_id = users.plan_id
GROUP BY plans.plan_id, plans.plan_name
ORDER BY total_users DESC;


-- ============================================
-- 4. Most-used AI Model
-- ============================================

SELECT
    models.model_name,
    COUNT(conversations.conversation_id) AS total_conversations
FROM models
LEFT JOIN conversations
    ON models.model_id = conversations.model_id
GROUP BY models.model_id, models.model_name
ORDER BY total_conversations DESC;


-- ============================================
-- 5. Conversations per User
-- ============================================

SELECT
    users.name,
    COUNT(conversations.conversation_id) AS total_conversations
FROM users
LEFT JOIN conversations
    ON users.user_id = conversations.user_id
GROUP BY users.user_id, users.name
ORDER BY total_conversations DESC;


-- ============================================
-- 6. Messages per Conversation
-- ============================================

SELECT
    conversations.conversation_id,
    COUNT(messages.message_id) AS total_messages
FROM conversations
LEFT JOIN messages
    ON conversations.conversation_id = messages.conversation_id
GROUP BY conversations.conversation_id
ORDER BY total_messages DESC;


-- ============================================
-- 7. Most Active Users
-- Metric: Total messages associated
-- with each user's conversations
-- ============================================

SELECT
    users.name,
    COUNT(messages.message_id) AS total_messages
FROM users
LEFT JOIN conversations
    ON users.user_id = conversations.user_id
LEFT JOIN messages
    ON conversations.conversation_id = messages.conversation_id
GROUP BY users.user_id, users.name
ORDER BY total_messages DESC;


-- ============================================
-- 8. AI Model-wise Usage
-- ============================================

SELECT
    models.model_name,
    models.model_type,
    COUNT(DISTINCT conversations.conversation_id) AS total_conversations,
    COUNT(messages.message_id) AS total_messages
FROM models
LEFT JOIN conversations
    ON models.model_id = conversations.model_id
LEFT JOIN messages
    ON conversations.conversation_id = messages.conversation_id
GROUP BY models.model_id, models.model_name, models.model_type
ORDER BY total_conversations DESC;


-- ============================================
-- 9. Subscription Plan Distribution
-- ============================================

SELECT
    plans.plan_name,
    COUNT(users.user_id) AS total_users,
    ROUND(
        COUNT(users.user_id) * 100.0 /
        (SELECT COUNT(*) FROM users),
        2
    ) AS user_percentage
FROM plans
LEFT JOIN users
    ON plans.plan_id = users.plan_id
GROUP BY plans.plan_id, plans.plan_name;


-- ============================================
-- 10. Average Messages per Conversation
-- ============================================

SELECT
    ROUND(AVG(message_count), 2) AS avg_messages_per_conversation
FROM (
    SELECT
        conversation_id,
        COUNT(*) AS message_count
    FROM messages
    GROUP BY conversation_id
) AS conversation_stats;
