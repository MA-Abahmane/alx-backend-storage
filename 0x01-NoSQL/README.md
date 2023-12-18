# NoSQL Cheat Sheet

## Types of NoSQL Databases

### 1. Document Store

#### MongoDB

- **Create Database**
  ```bash
  use <database_name>
  ```

- **Insert Document**
  ```bash
  db.<collection_name>.insert({ key: value })
  ```

- **Query Document**
  ```bash
  db.<collection_name>.find({ key: value })
  ```

### 2. Key-Value Store

#### Redis

- **Set Key-Value Pair**
  ```bash
  SET key value
  ```

- **Get Value by Key**
  ```bash
  GET key
  ```

### 3. Column-family Store

#### Cassandra

- **Create Keyspace**
  ```bash
  CREATE KEYSPACE <keyspace_name> WITH replication = {'class': 'SimpleStrategy', 'replication_factor': <factor>}
  ```

- **Create Table**
  ```bash
  CREATE TABLE <table_name> (<column1_name> <type1>, <column2_name> <type2>, PRIMARY KEY (<primary_key>))
  ```

- **Insert Data**
  ```bash
  INSERT INTO <table_name> (<column1_name>, <column2_name>) VALUES (<value1>, <value2>)
  ```

### 4. Graph Database

#### Neo4j

- **Create Node**
  ```bash
  CREATE (:Label { key: value })
  ```

- **Create Relationship**
  ```bash
  MATCH (a:Label1), (b:Label2) WHERE a.key = value1 AND b.key = value2 CREATE (a)-[:RELATIONSHIP]->(b)
  ```

## Common Operations

- **Indexing**
  - MongoDB:
    ```bash
    db.<collection_name>.createIndex({ key: 1 })
    ```
  - Cassandra:
    ```bash
    CREATE INDEX ON <table_name> (<column_name>)
    ```

- **Aggregation**
  - MongoDB:
    ```bash
    db.<collection_name>.aggregate([ { $group: { _id: "$key", count: { $sum: 1 } } } ])
    ```
  - Neo4j:
    ```bash
    MATCH (n:Label) RETURN n.key, COUNT(n) AS count
    ```

- **Backup and Restore**
  - MongoDB:
    - Backup:
      ```bash
      mongodump --db <database_name> --out <backup_directory>
      ```
    - Restore:
      ```bash
      mongorestore --db <database_name> <backup_directory>/<database_name>
      ```
  - Redis:
    - Backup:
      ```bash
      SAVE
      ```
    - Restore:
      ```bash
      BGSAVE
      ```

## Tips and Best Practices

- **Data Modeling**
  - Choose the database type based on your data structure and access patterns.
  - Denormalize data when needed for better read performance.

- **Scalability**
  - NoSQL databases are designed for horizontal scalability. Distribute data across multiple nodes.

- **Consistency**
  - NoSQL databases may provide eventual consistency instead of immediate consistency. Understand and design for your application's requirements.

- **Security**
  - Implement proper authentication and authorization mechanisms.
  - Regularly update and patch your NoSQL database.

- **Monitoring and Optimization**
  - Monitor database performance and optimize queries for better efficiency.
  - Utilize caching mechanisms to improve read performance.

