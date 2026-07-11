# 💳 Java JDBC Bank Transaction System

A **Bank Transaction Management System** developed using **Java, JDBC, and MySQL**. This project demonstrates how to connect Java with a MySQL database and perform secure money transfers using **JDBC Transactions (Commit & Rollback)**.

The application checks the sender's balance before transferring funds. If any error occurs during the transaction (such as insufficient balance or invalid account), the entire transaction is rolled back, ensuring data consistency.

---

## 📸 Project Output

![Project Output](assets/Otput.png)

---

# 🚀 Features

- ✅ Connect Java with MySQL using JDBC
- ✅ Automatically create database table
- ✅ Insert sample account records
- ✅ Secure money transfer between accounts
- ✅ Check sender account balance
- ✅ Commit transaction on success
- ✅ Rollback transaction on failure
- ✅ Exception handling
- ✅ PreparedStatement implementation
- ✅ Display updated account information

---

# 🛠️ Technologies Used

| Technology | Purpose |
|------------|---------|
| Java | Programming Language |
| JDBC | Database Connectivity |
| MySQL | Database |
| Eclipse IDE | Development Environment |
| MySQL Connector/J | JDBC Driver |

---

# 📁 Project Structure

```
Java-JDBC-Bank-System/
│
├── src/
│   └── Mini/
│       └── JDBC.java
│
├── assets/
│   └── output.png
│
└── README.md
```

---

# 🗄 Database

### Database Name

```
Accounts
```

### Table Name

```
Acc_Transactions
```

### Table Structure

| Column | Data Type |
|----------|-----------|
| Acc_Number | INT PRIMARY KEY |
| Acc_Name | VARCHAR(20) |
| Acc_Balance | FLOAT |

The table is created automatically when the program runs.

---

# 📌 Sample Data

| Account No | Name | Balance |
|------------|------|----------|
| 101 | RB | 10000 |
| 102 | JOHN | 5000 |

---

# 📝 SQL Queries Used

## Create Table

```sql
CREATE TABLE IF NOT EXISTS Acc_Transactions(
    Acc_Number INT PRIMARY KEY,
    Acc_Name VARCHAR(20),
    Acc_Balance FLOAT
);
```

---

## Insert Sample Records

```sql
INSERT IGNORE INTO Acc_Transactions
VALUES
(101,'RB',10000),
(102,'JOHN',5000);
```

---

## Check Balance

```sql
SELECT Acc_Balance
FROM Acc_Transactions
WHERE Acc_Number = ?;
```

---

## Withdraw Amount

```sql
UPDATE Acc_Transactions
SET Acc_Balance = Acc_Balance - ?
WHERE Acc_Number = ?;
```

---

## Deposit Amount

```sql
UPDATE Acc_Transactions
SET Acc_Balance = Acc_Balance + ?
WHERE Acc_Number = ?;
```

---

## Display Records

```sql
SELECT *
FROM Acc_Transactions;
```

---

# ⚙️ Transaction Flow

```
                Start
                  │
                  ▼
       Load JDBC Driver
                  │
                  ▼
      Connect to MySQL Database
                  │
                  ▼
          Create Table
                  │
                  ▼
      Insert Sample Records
                  │
                  ▼
     Enter Sender Account
                  │
                  ▼
    Enter Receiver Account
                  │
                  ▼
     Enter Transfer Amount
                  │
                  ▼
      Check Account Balance
                  │
        ┌─────────┴─────────┐
        │                   │
        ▼                   ▼
Balance Available?         No
        │                   │
       Yes          Throw Exception
        │                   │
        ▼                   ▼
 Withdraw Amount      Rollback
        │
        ▼
 Deposit Amount
        │
        ▼
 Commit Transaction
        │
        ▼
Display Updated Accounts
        │
        ▼
               End
```

---

# 🔄 Transaction Management

Auto Commit is disabled before starting the transaction.

```java
con.setAutoCommit(false);
```

If all operations execute successfully,

```java
con.commit();
```

If any exception occurs,

```java
con.rollback();
```

This ensures the database always remains consistent.

---

# ⚠️ Exception Handling

The program handles the following cases:

- Sender account not found
- Insufficient balance
- SQL Exceptions
- Invalid transaction
- Database errors

Whenever an exception occurs,

- Transaction is rolled back.
- Database remains unchanged.

---

# ▶️ Sample Successful Execution

```
Establishing the Driver and Connection to DB...

Driver established successfully..

Connection established successfully!!

=========Money Transfer=========

Enter sender Account Number: 101

Enter Receiver Account Number: 102

Enter Amount to Transfer: 2000

Available Balance: 10000

Transaction Successful !!

===Account Details===

101     RB      8000

102     JOHN    7000
```

---

# ❌ Rollback Example

### Input

```
Sender Account : 101

Receiver Account : 102

Transfer Amount : 20000
```

### Output

```
Available Balance : 10000

Transaction Failed !!

Rollback

Reason:
Insufficient Balance
```

### Database After Rollback

```
101     RB      10000

102     JOHN     5000
```

No data is modified because the transaction is rolled back.

---

# 💻 Prerequisites

- Java JDK 17 or above
- MySQL Server
- Eclipse IDE
- MySQL Connector/J Driver

---

# 🚀 Installation

## Clone Repository

```bash
git clone https://github.com/yourusername/Java-JDBC-Bank-Transaction-System.git
```

---

## Open in Eclipse

Import the project into Eclipse.

---

## Create Database

```sql
CREATE DATABASE Accounts;
```

---

## Update Credentials

```java
String url = "jdbc:mysql://localhost:3306/Accounts";
String userName = "root";
String password = "root";
```

---

## Add JDBC Driver

Add

```
mysql-connector-j.jar
```

to your project's Build Path.

---

## Run

Execute

```
JDBC.java
```

---

# 📚 Concepts Covered

- Java
- JDBC
- DriverManager
- Connection
- PreparedStatement
- ResultSet
- SQL
- Transactions
- Commit
- Rollback
- Exception Handling
- Try-With-Resources

---

# 🎯 Learning Outcomes

After completing this project, you will understand:

- Java Database Connectivity (JDBC)
- Connecting Java with MySQL
- Executing SQL Queries
- PreparedStatement Usage
- Reading Data using ResultSet
- Transaction Management
- Commit & Rollback
- Database Consistency
- Exception Handling
- Resource Management using Try-With-Resources

---

# 🔮 Future Enhancements

- User Login Authentication
- Create New Account
- Deposit Money
- Withdraw Money
- Delete Account
- Update Account Details
- Transaction History
- Mini Statement
- Interest Calculation
- Swing GUI
- JavaFX Interface
- Spring Boot REST API
- Account Validation

---

# 👨‍💻 Author

**Bharath R**

**AI & Data Science Graduate**

### Skills

- Java
- JDBC
- MySQL
- Python
- SQL
- HTML
- CSS
- JavaScript

---

## ⭐ Support

If you found this project useful, please consider **starring ⭐ the repository** and sharing your feedback.

Happy Coding! 🚀
