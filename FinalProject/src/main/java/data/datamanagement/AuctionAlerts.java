package data.datamanagement;

import java.sql.*;

public class AuctionAlerts {

	
	/**
	 * Get the currently active auctions that the email has taken part in. Inform them of any auctions they need to look at.
	 * 
	 * @param email
	 * @throws SQLException 
	 */
	public static String getAuctionAlerts(String email) throws SQLException {
		
		ApplicationDB db = new ApplicationDB();
		Connection c = db.getConnection();
		Statement s = c.createStatement();
		
		String query = String.format("select DISTINCT a.auction_ID, a.currentBid, a.winner "
				+ "from BidOnPlaces b, AuctionCreates a "
				+ "where b.auction_ID = a.auction_ID and a.endTime > NOW() "
				+ "and b.email='%s' and a.winner<>b.email;", email);
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
