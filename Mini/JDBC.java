package Mini;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Scanner;

public class JDBC {
	public static void main(String[] args) {
		String url = "jdbc:mysql://localhost:3306/Accounts";
		String userName = "root";
		String password = "password";
		ResultSet res = null;

		// Queries
		String table = "CREATE TABLE IF NOT EXISTS Acc_Transactions (" + "Acc_Number INT PRIMARY KEY, "
				+ "Acc_Name VARCHAR(20), " + "Acc_Balance FLOAT" + ")";

		String insertRecord = "INSERT IGNORE INTO Acc_Transactions VALUES " + "(101, 'RB', 10000),"
				+ "(102, 'JOHN', 5000)";

		String balance = "SELECT Acc_Balance FROM Acc_Transactions WHERE Acc_Number = ? ";

		String withdraw = "UPDATE Acc_Transactions SET Acc_Balance = Acc_Balance - ? WHERE Acc_Number = ?";

		String deposit = "UPDATE Acc_Transactions SET Acc_Balance = Acc_Balance + ? WHERE Acc_Number = ?";

		String selection = "SELECT * FROM Acc_Transactions";

		try {
			System.out.println("Establishing the Driver and Connection to DB...");
			Class.forName("com.mysql.cj.jdbc.Driver");
			Thread.sleep(3000);
			System.out.println("\nDriver established successfully..");
			Thread.sleep(3000);

			try (Connection con = DriverManager.getConnection(url, userName, password);
					PreparedStatement tableStmt = con.prepareStatement(table);
					PreparedStatement insertStmt = con.prepareStatement(insertRecord);
					PreparedStatement balanceStmt = con.prepareStatement(balance);
					PreparedStatement withdrawStmt = con.prepareStatement(withdraw);
					PreparedStatement depositStmt = con.prepareStatement(deposit);
					PreparedStatement selectStmt = con.prepareStatement(selection);
					Scanner scan = new Scanner(System.in);) {
					System.out.println("\nConnection established successfully!!");
					Thread.sleep(2000);
					
				try {
					// Disable auto commit
					con.setAutoCommit(false);
					

					System.out.println("\n=========Money Transfer=========");

					// User input
					System.out.print("\nEnter sender Account Number: ");
					int sender = scan.nextInt();

					System.out.print("\nEnter Receiver Acccount number: ");
					int receiver = scan.nextInt();

					System.out.print("\nEnter Amount to Transfer: ");
					Float amount = scan.nextFloat();

					tableStmt.executeUpdate();
					insertStmt.executeUpdate();

					// Check sender balance
					balanceStmt.setInt(1, sender);

					ResultSet balanceRes = balanceStmt.executeQuery();

					float Acc_Balance = 0;

					if (balanceRes.next()) {
						Acc_Balance = balanceRes.getFloat("Acc_Balance");
					} else {
						throw new Exception("Sender account not found !");
					}

					System.out.println("\nAvailable balance: " + Acc_Balance);

					// Check Balance
					if (Acc_Balance < amount) {
						throw new Exception("Insufficient balance !");
					}

					// Withdraw
					withdrawStmt.setFloat(1, amount);
					withdrawStmt.setInt(2, sender);

					withdrawStmt.executeUpdate();

					// Deposit
					depositStmt.setFloat(1, amount);
					depositStmt.setInt(2, receiver);

					depositStmt.executeUpdate();

					// Commit transactions
					con.commit();

					System.out.println("\nTransaction Successfull !!!");

				} catch (Exception e) {

					// Rollback Transaction
					con.rollback();

					System.out.println("\nTransaction Failed!!");
					System.out.println("\nRollback");

					System.out.println("Reason: " + e.getMessage());

				}

				// Dispaly updtaed Table
				System.out.println("\n===Account Details===");
				res = selectStmt.executeQuery();

				while (res.next()) {
					System.out.println(res.getInt("Acc_Number") + "\t" + res.getString("Acc_Name") + "\t"+
							+ res.getFloat("Acc_Balance"));
				}

			}

		} catch (Exception e) {
			e.printStackTrace();

		}

	}
}
