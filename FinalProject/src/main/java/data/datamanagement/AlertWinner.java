package data.datamanagement;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class AlertWinner {

	public static String alertWinner(String email) throws SQLException {
		ApplicationDB db = new ApplicationDB();
		Connection c = db.getConnection();
		Statement s = c.createStatement();
		
		String query = String.format("select DISTINCT a.auction_ID, a.currentBid, a.winner "
				+ "from AuctionCreates a "
				+ "where a.endTime < NOW() and a.winner='%s';", email);
		ResultSet set = s.executeQuery(query);
		
		String total = "<table border=1><tr><th>Auction ID</th><th>Current Bid</th><th>Current Winner</th></tr>";
		
		while(set.next()) {
			total += "<tr><td>" + set.getInt(1) + "</td><td>" + set.getInt(2) + "</td>"
					+ "<td>" + set.getString(3) + "</td></tr>";
		}
		
		total += "</table>";
		
		return total;
	}
	
}
