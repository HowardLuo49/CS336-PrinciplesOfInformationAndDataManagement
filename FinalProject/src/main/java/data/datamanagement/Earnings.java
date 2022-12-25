package data.datamanagement;

import java.sql.Connection;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.time.LocalDate;

public class Earnings {

	ApplicationDB db = new ApplicationDB();

	private static final double PERCENT_TAKEN = 0.05;

	public Earnings() {
	}

	public String getEarningsItem() throws SQLException {
		String total = "<table><tr><th>Item ID</th><th>Earnings On Item</th></tr>";

		Connection connection = db.getConnection();
		Statement statement = connection.createStatement();

		ResultSet results = statement.executeQuery("select item_ID, sum(currentBid) from AuctionCreates where endTime < NOW() group by item_ID;");

		while(results.next()) {
			int item = results.getInt(1);
			double totalEarningsItem = Earnings.PERCENT_TAKEN * results.getInt(2);
			
			total += "<tr><td>" + item + "</td><td>" + totalEarningsItem + "</td></tr>";
			 
		}
		
		connection.close();
		
		total += "</table>";
		
		return total;
	}
	
	public String getEarningsItemType() throws SQLException {
		String total = "<table><tr><th>Item Type</th><th>Earnings</th></tr>";
		
		Connection connection = db.getConnection();
		Statement statement = connection.createStatement();

		ResultSet results = statement.executeQuery("select b.category_name, sum(currentBid) from AuctionCreates a, CategorySubCategory_1SubCategory_2SubCategory_3 b where a.endTime < NOW() and a.item_ID = b.item_ID group by b.category_name;");
		
		while(results.next()) {
			String itemCategory = results.getString(1);
			double totalEarningsCategory = Earnings.PERCENT_TAKEN * results.getInt(2);
			
			total += "<tr><td>" + itemCategory + "</td><td>" + totalEarningsCategory + "</td></tr>";
			
		}
		connection.close();
		
		total += "</table>";
		return total;
	}
	
	public String getEarningsUser() throws SQLException {
		String total = "<table><tr><th>Email</th><th>Earnings</th></tr>";
		
		Connection connection = db.getConnection();
		Statement statement = connection.createStatement();

		ResultSet results = statement.executeQuery("select a.email, sum(a.currentBid) from AuctionCreates a, AccountCustomerRepAdminStaff b where a.email = b.email and a.endTime < NOW() group by a.email;");
		
		while(results.next()) {
			String username = results.getString(1);
			double earningsTotal = Earnings.PERCENT_TAKEN * results.getInt(2);
			
			total += "<tr><td>" + username + "</td><td>" + earningsTotal + "</td></tr>";
			
		}
		
		connection.close();
		
		return total;
	}

	public double getEarningsTotal() throws SQLException {
		double total = 0;

		Connection connection = db.getConnection();
		Statement statement = connection.createStatement();

		ResultSet results = statement.executeQuery("select endTime, currentBid from AuctionCreates;");

		while (results.next()) {
			Date date = results.getDate(1);

			if (date.before(Date.valueOf(LocalDate.now()))) {
				total += Earnings.PERCENT_TAKEN * results.getInt(2);
			}

		}
		
		connection.close();

		return total;
	}

}