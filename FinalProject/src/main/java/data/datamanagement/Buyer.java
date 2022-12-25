package data.datamanagement;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class Buyer {

	String email;
	int bidID;
	int auctionID;
	int upperLimit;
	int amount;
	
	public Buyer(String email, int bidID, int auctionID, int upperLimit, int amount) {
		this.email = email;
		this.bidID = bidID;
		this.auctionID = auctionID;
		this.upperLimit = upperLimit;
		this.amount = amount;
	}
	
	/**
	 * Gets the buyers who still can buy. AKA upper limit < the bid they would have to place.
	 */
	public static ArrayList<Buyer> getBuyers(int auctionID, int currentBid, 
			int increment, String currentHolder) throws SQLException {
		ArrayList<Buyer> temp = new ArrayList<Buyer>();
		
		ApplicationDB db = new ApplicationDB();
		Connection connection = db.getConnection();
		Statement statement = connection.createStatement();
		String query = String.format("select email, bid_ID, auction_ID, upper_limit, amount "
				+ "from BidOnPlaces "
				+ "where auction_ID=%s and upper_limit >= %s", auctionID, currentBid + increment);
		ResultSet set = statement.executeQuery(query);
		
		while(set.next()) {
			String email = set.getString(1);
			int bid = set.getInt(2);
			int aId = set.getInt(3);
			int upperLimit = set.getInt(4);
			int amount = set.getInt(5);
			
			if(email.equals(currentHolder))
				continue;
			else {
				Buyer buyer = new Buyer(email, bid, aId, upperLimit, amount);
				temp.add(buyer);
			}
			
		}
		
		connection.close();
		
		return temp;
	}
	
}
