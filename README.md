Project Title:
📌 Football Club Management Databas


Project Description:
The Football Club Management Database is a relational database built using MySQL to manage essential details about a football club, including teams, players, matches, coaches, sponsorships, and fans. The system maintains structured data with relationships and constraints to ensure data integrity.
With this database, users can:
✅ Store and manage football teams and their founding years
✅ Track player details, positions, and their respective teams
✅ Record match details, including scores, participating teams, and dates
✅ Maintain a list of coaches assigned to teams

The system follows best practices in database design, including primary keys (PK), foreign keys (FK), constraints, and relationships like one-to-one (1-1), one-to-many (1-M), and many-to-many (M-M).


How to Run/Setup the Project
Step 1: Install MySQL
Ensure MySQL Server is installed on your machine. If not, download it from MySQL Official Website.
Step 2: Create and Import the Database
1️⃣ Open MySQL Workbench or any MySQL-compatible tool
2️⃣ Create a new database with:
CREATE DATABASE FootballClub;
USE FootballClub;


3️⃣ Copy and execute the provided SQL schema and sample data
Step 3: Insert Sample Data
Run the sample data insertion queries to populate the tables.

Step 4: Run Queries
Execute queries like:
-- Retrieve all players and their teams
SELECT Players.name AS Player, Players.position, Teams.team_name AS Team 
FROM Players
JOIN Teams ON Players.team_name = Teams.team_name;


Now, you can use queries to manage and retrieve football club information efficiently!

Entity Relationship Diagram (ERD)

