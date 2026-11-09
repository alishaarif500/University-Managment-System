# University Management System (Java + SQLite)

A Java Swing desktop application for managing core university academic records. This repository is structured as a Maven project and uses SQLite for a portable local database.

## Technology stack

- Java 17+
- Java Swing
- SQLite with Xerial SQLite JDBC
- Maven
- JUnit 5

## Current implemented functionality

- First-run administrator account setup
- Login with salted PBKDF2-HMAC-SHA256 password hashing
- CRUD screens for students, teachers, departments, courses, registrations, attendance, examinations, and results
- Search across the displayed record fields
- Dashboard record counts
- Prepared SQL statements and foreign-key constraints
- SQLite database initialization on application startup

## Database design

The database schema includes users, departments, students, teachers, courses, course registrations, attendance, examinations, and results. The desktop interface exposes record screens for the academic modules. Result grades are assigned from percentage bands (A ≥ 85, B ≥ 75, C ≥ 65, D ≥ 50, otherwise F); marks above the examination maximum are rejected. User-account administration beyond first-run administrator creation is not yet exposed in the GUI.

## Requirements

- JDK 17 or later
- Maven 3.9 or later
- Internet access on the first Maven build so Maven can download dependencies

## Run

1. Install a JDK 17+ and Maven.
2. Open this project folder in IntelliJ IDEA or VS Code with Java and Maven support.
3. In a terminal at the project root, run:

   ```bash
   mvn clean test
   mvn package
   ```

4. Launch with Maven:

   ```bash
   mvn exec:java -Dexec.mainClass="com.alisha.ums.app.Main"
   ```

   Or run `com.alisha.ums.app.Main` from the IDE after Maven dependencies have been imported.

The SQLite database is created automatically at `~/.university-management-system/university.db` (on Windows this is under your user home directory). It is intentionally outside the source repository so private/local data is not committed accidentally.

## First launch

Select **First-time setup** on the login screen and create an administrator username and a strong password of at least 10 characters. This option is available only while the database contains no users. There is no hardcoded default password.

## Sample data

`database/schema.sql` documents the schema. `database/sample_data.sql` contains optional fictional starter records. The application creates the schema automatically. To load sample data, use a SQLite client against the database file after first launch.

## Tests

The JUnit 5 tests cover password hashing, correct-password verification, incorrect-password rejection, and per-password salt uniqueness. The current verification run compiled all main Java sources with `javac --release 17`, exercised password hashing with a standalone Java check, and executed the SQL schema/sample data with Python SQLite. Maven/JUnit execution, the Xerial JDBC connection, and full GUI interaction have not been verified in this build environment.

## Security notes

- Passwords are stored as salted PBKDF2-HMAC-SHA256 hashes using Java's standard cryptography APIs.
- SQL values use prepared statements.
- Database foreign-key enforcement is enabled for each connection.
- This is an educational portfolio project, not a production-certified university information system. A production deployment would require additional authorization policies, audit logging, backup/recovery, privacy review, and broader automated testing.

## License

MIT License. See `LICENSE`.
