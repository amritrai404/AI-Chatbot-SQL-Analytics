````
# AI Chatbot Usage Analytics — Business Questions

This document contains the key business questions analyzed using SQL in the AI Chatbot Usage Analytics project.

The analysis focuses on users, subscription plans, conversations, messages, and AI model usage.

---

## 1. How many total users are registered on the platform?

### SQL Query

```sql
SELECT COUNT(*) AS total_users
FROM users;
````

 ### Answer

 The platform contains **10 users** in the sample dataset.

---

 ## 2\. How many users are on the Free and Premium plans?

 ### SQL Query

```
SELECT
    plans.plan_name,
    COUNT(users.user_id) AS total_users
FROM plans
LEFT JOIN users
    ON plans.plan_id = users.plan_id
GROUP BY plans.plan_id, plans.plan_name;
```

 ### Answer

 The sample dataset contains:

 - **5 Free users**
- **5 Premium users**

---

 ## 3\. How many users belong to each subscription plan?

 ### SQL Query

```
SELECT
    plans.plan_name,
    COUNT(users.user_id) AS total_users
FROM plans
LEFT JOIN users
    ON plans.plan_id = users.plan_id
GROUP BY plans.plan_id, plans.plan_name
ORDER BY total_users DESC;
```

 ### Answer

 The query groups users according to their subscription plan and displays the number of users in each plan.

---

 ## 4\. Which AI model has the highest number of conversations?

 ### SQL Query

```
SELECT
    models.model_name,
    COUNT(conversations.conversation_id) AS total_conversations
FROM models
LEFT JOIN conversations
    ON models.model_id = conversations.model_id
GROUP BY models.model_id, models.model_name
ORDER BY total_conversations DESC;
```

 ### Answer

 Based on the sample dataset, **GPT-4o** has the highest number of conversations.

---

 ## 5\. How many conversations does each user have?

 ### SQL Query

```
SELECT
    users.name,
    COUNT(conversations.conversation_id) AS total_conversations
FROM users
LEFT JOIN conversations
    ON users.user_id = conversations.user_id
GROUP BY users.user_id, users.name
ORDER BY total_conversations DESC;
```

 ### Answer

 This query calculates the number of conversations associated with each user.

 The `LEFT JOIN` also allows users with zero conversations to appear in the results.

---

 ## 6\. How many messages are there in each conversation?

 ### SQL Query

```
SELECT
    conversations.conversation_id,
    COUNT(messages.message_id) AS total_messages
FROM conversations
LEFT JOIN messages
    ON conversations.conversation_id = messages.conversation_id
GROUP BY conversations.conversation_id
ORDER BY total_messages DESC;
```

 ### Answer

 This query measures conversation depth by counting the messages associated with each conversation.

---

 ## 7\. Who are the most active users?

 ### Activity Definition

 For this project, user activity is measured using the **total number of messages associated with a user's conversations**.

 ### SQL Query

```
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
```

 ### Answer

 The query orders users by their total message activity, allowing the most active users to be identified.

---

 ## 8\. How much usage does each AI model receive?

 ### SQL Query

```
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
```

 ### Answer

 This analysis measures AI model usage using:

 - Total conversations
- Total messages

 The results can be used to compare usage across the available AI models.

---

 ## 9\. What percentage of users belong to each subscription plan?

 ### SQL Query

```
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
```

 ### Answer

 This query calculates both the number and percentage of users belonging to each subscription plan.

 For the sample dataset:

 - Free: **50%**
- Premium: **50%**

---

 ## 10\. What is the average number of messages per conversation?

 ### SQL Query

```
SELECT
    ROUND(AVG(message_count), 2) AS avg_messages_per_conversation
FROM (
    SELECT
        conversation_id,
        COUNT(*) AS message_count
    FROM messages
    GROUP BY conversation_id
) AS conversation_stats;
```

 ### Answer

 The sample dataset contains an average of **3 messages per conversation**.

---

 # SQL Concepts Used

 The project demonstrates the following SQL concepts:

 - `SELECT`
- `WHERE`
- `COUNT`
- `AVG`
- `SUM`
- `ROUND`
- `ORDER BY`
- `GROUP BY`
- `INNER JOIN`
- `LEFT JOIN`
- `COUNT(DISTINCT ...)`
- Subqueries

---

 # Database Relationships

 The main relationships in the database are:

```
Plans
  ↓
Users
  ↓
Conversations
  ↓
Messages

Models
  ↓
Conversations
```

 More specifically:

```
plans.plan_id
      ↓
users.plan_id

users.user_id
      ↓
conversations.user_id

models.model_id
      ↓
conversations.model_id

conversations.conversation_id
      ↓
messages.conversation_id
```

---

 # Dataset Summary

 | Table | Records |
| --- | --- |
| Plans | 2 |
| Users | 10 |
| Models | 3 |
| Conversations | 10 |
| Messages | 30 |

---

 # Project Purpose

 The purpose of this analysis is to demonstrate how SQL can be used to analyze an AI chatbot SaaS platform.

 The project connects database design with practical analytics questions involving:

 - User activity
- Subscription plans
- AI model usage
- Conversation volume
- Message volume
- Usage patterns

---

 # Conclusion

 This project demonstrates the use of relational database design and SQL analytics to extract meaningful information from an AI chatbot platform dataset.

 The analysis progresses from basic queries to multi-table joins, grouping, aggregation, and business-oriented questions.

````
