package data.datamanagement;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;

public class DecideWinner {

	/*
	 * Set the winner to none if the highest bid is less than the minimum price.
	 */
	public static void setWinner() throws SQLException {
		ApplicationDB db = new ApplicationDB();
		Connection c = db.getConnection();
		
		String query = "update AuctionCreates "
				+ "set winner='None' "
				+ "where endTime < NOW() and currentBid < minPrice;";
		
		Statement s = c.createStatement();
		s.executeUpdate(query);
		
		c.close();
		
	}
	
}
