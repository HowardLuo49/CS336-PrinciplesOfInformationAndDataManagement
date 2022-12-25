package data.datamanagement;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Timer;
import java.util.TimerTask;

public class AutoBidding extends TimerTask {

	public static boolean CHECK_STARTED = false;

	public static void autoBid() throws SQLException {

		ArrayList<Auction> auctions = getAuctionBids();

		for (Auction a : auctions) {
			a.updateAuction();
		}

	}

	public static ArrayList<Auction> getAuctionBids() throws SQLException {

		ArrayList<Auction> a = new ArrayList<Auction>();

		ApplicationDB db = new ApplicationDB();
		Connection connection = db.getConnection();

		Statement statement = connection.createStatement();
		String query = String.format("select auction_ID, currentBid, bidIncrement, winner " + "from AuctionCreates "
				+ "where endTime > NOW();");
		ResultSet auctionIDindex = statement.executeQuery(query);

		while (auctionIDindex.next()) {
			int id = auctionIDindex.getInt(1);
			int currentBid = auctionIDindex.getInt(2);
			int bidIncrement = auctionIDindex.getInt(3);
			String currentHolder = auctionIDindex.getString(4);
			Auction auction = new Auction(id, currentBid, bidIncrement, currentHolder);
			a.add(auction);
		}
		
		connection.close();

		return a;
	}

	@Override
	public void run() {
		try {
			AutoBidding.autoBid();
			DecideWinner.setWinner();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public static void setTimer() {
		if (!AutoBidding.CHECK_STARTED) {
			System.out.println("Started AutoBidder.");
			Timer t = new Timer(true);
			t.schedule(new AutoBidding(), 0, 5000);
			AutoBidding.CHECK_STARTED = true;
		}
	}

}
