# SQL Querying Assignment - Solution Structure and Usage

## Solution Structure

The solution is organized by task, with each task having its own directory containing:
- `.sql` file(s) with the query/queries
- `.md` file(s) with explanations and answers

Example structure:
```
solutions/
  task1/
    task1.sql
    task1.md
  task2/
    task2.sql
    task2.md
  ...
  task9/
    task9.sql
    task9.md
```

Databases used:
- `world` (for tasks 1–4)
- `AdventureWorks` (for tasks 5–9)

---

## How to Run the Queries Using Docker Compose

### 1. Unzip and Prepare the Database Files
- Unzip `docker-world-mysql.zip` and `docker-aw-mysql.zip`.
- Each should contain a `docker-compose.yml` and SQL dump/init scripts.

### 2. Start the MySQL Containers
Navigate to each unzipped directory and run:
```sh
docker compose up -d
```
(or, if using older Docker: `docker-compose up -d`)

This will start a MySQL server with the appropriate database preloaded.

### 3. Connect to the MySQL Server
You can connect using the MySQL CLI, DBeaver, MySQL Workbench, or any other SQL client.

**Example using MySQL CLI:**
```sh
docker exec -it <container_name> mysql -u root -p
```
- Find `<container_name>` with `docker ps`.
- The password is set in `docker-compose.yml` (commonly `root` or `password`).

**Example using DBeaver:**
1. Open DBeaver and click "New Database Connection"
2. Select "MySQL" as the database type
3. Fill in the connection details:
   - Server Host: `localhost`
   - Port: `3306` (or the port specified in docker-compose.yml)
   - Database: `world` or `AdventureWorks`
   - Username: `root`
   - Password: (the password from docker-compose.yml)
4. Click "Test Connection" to verify
5. Click "Finish" to save and connect

**To connect from your host:**
- Check the `ports` section in `docker-compose.yml` (usually `3306:3306`).
- Use `localhost:3306` as the host/port in your SQL client.

### 4. Select the Database
Once connected, select the database:
```sql
USE world;
-- or
USE AdventureWorks;
```

### 5. Run the Queries
For each task:
- Open the corresponding `.sql` file (e.g., `solutions/task3/task3.sql`).
- Copy and paste the query into your SQL client, or use the `source` command if supported.

**Example SQL Script:**
```sql
-- First, select the appropriate database
USE world;

-- Example query to find countries with population > 100 million
SELECT 
    Name AS Country,
    Population,
    Continent
FROM country
WHERE Population > 100000000
ORDER BY Population DESC;

-- Example query with JOIN to find cities in these countries
SELECT 
    c.Name AS Country,
    ct.Name AS City,
    ct.Population AS CityPopulation
FROM country c
JOIN city ct ON c.Code = ct.CountryCode
WHERE c.Population > 100000000
ORDER BY ct.Population DESC
LIMIT 10;
```

**To run the script:**
```sql
source /path/to/solutions/task3/task3.sql;
```
Or simply paste the query and execute.

### 6. View and Interpret Results
- Results will be shown in your SQL client.
- For interpretation, refer to the corresponding `.md` file for each task.

---

## Tips
- To reset the database, stop and remove the container, then run `docker compose up -d` again.
- If you encounter connection issues, check the `docker-compose.yml` for the correct port, username, and password.
- For AdventureWorks, table names are case-sensitive and often use schemas (e.g., `HumanResources.Employee`).
