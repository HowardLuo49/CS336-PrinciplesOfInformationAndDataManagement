package data.datamanagement;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class Auction {
	int auctionid;
	int currentbid;
	int bidincrement;
	String currentHolder;
	
	public Auction(int auctionid, int currentbid, int bidincrement, String currentHolder) {
		this.auctionid = auctionid;
		this.currentbid = currentbid;
		this.bidincrement = bidincrement;
		this.currentHolder = currentHolder;
	}
	
	public int getNextBid() {
		return currentbid + bidincrement;
	}
	
	public void updateCurrentBid(int newAmount, String emailOfBuyer) throws SQLException {
		
		this.currentbid = newAmount;
		this.currentHolder = emailOfBuyer;
		
		ApplicationDB db = new ApplicationDB();
		Connection connection = db.getConnection();
		
		System.out.printf("New Bidder: %s with %d\n", this.currentHolder, this.currentbid);
		
		Statement statement = connection.createStatement();
		String query = String.format("update AuctionCreates "
				+ "set currentBid=%s, winner='%s' "
				+ "where auction_ID=%s", this.currentbid, this.currentHolder, this.auctionid);
		statement.executeUpdate(query);
		
		connection.close();
		
	}
	
	public void updateAuction() throws SQLException {
		ArrayList<Buyer> buyers = Buyer.getBuyers(this.auctionid, this.currentbid, this.bidincrement, this.currentHolder);
		
		if(buyers.size() == 0)
			return;
		
		Buyer newBuyer = null;
		
		for(int i = buyers.size() - 1; i >= 0; i--) {
			if(!buyers.get(i).email.equalsIgnoreCase(currentHolder) && !buyers.get(i).email.equals(currentHolder)) {
				// Get a new valid bidder.
				newBuyer = buyers.get(i);
			}
		}
		
		if(newBuyer == null) {
			return;
		}
 		
		newBuyer.amount = getNextBid();
		this.updateCurrentBid(getNextBid(), newBuyer.email);
		this.createNewBid(newBuyer);
	}
	
	public void createNewBid(Buyer buyer) throws SQLException {
		ApplicationDB db = new ApplicationDB();
		db.insertBidOnPlaces(buyer.amount, this.auctionid, buyer.email, buyer.upperLimit);
	}
	
}
