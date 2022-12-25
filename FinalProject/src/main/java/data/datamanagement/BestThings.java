package data.datamanagement;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class BestThings {

	ApplicationDB db = new ApplicationDB();
	
	public String getBestItem() throws SQLException {
		String total = "<table><tr><th>Item ID</th><th>Bidded Amount</th></tr>";

		Connection connection = db.getConnection();
		Statement statement = connection.createStatement();

		ResultSet results = statement.executeQuery("select a.item_ID, sum(currentBid) as total "
				+ "from AuctionCreates a where a.endTime < NOW() group by a.item_ID order by total DESC;");
		
		while(results.next()) {
			int item = results.getInt(1);
			double totalEarningsItem = results.getInt(2);
			
			total += "<tr><td>" + item + "</td><td>" + totalEarningsItem + "</td></tr>";
		}
		
		total += "</table>";
		return total;
	}
	
	public String getBestUser() throws SQLException {
		String total = "<table><tr><th>Email</th><th>Amount</th></tr>";
		
		Connection connection = db.getConnection();
		Statement statement = connection.createStatement();

		ResultSet results = statement.executeQuery("select a.email, sum(a.currentBid) as total "
				+ "from AuctionCreates a, AccountCustomerRepAdminStaff b "
				+ "where a.winner = b.email and a.endTime < current_date() group by a.email order by total DESC;");
		
		while(results.next()) {
			String username = results.getString(1);
			double earningsTotal = results.getInt(2);
			
			total += "<tr><td>" + username + "</td><td>" + earningsTotal + "</td></tr>";
			
		}
		
		connection.close();
		
		total += "</table>";
		
		return total;
	}
	
}
