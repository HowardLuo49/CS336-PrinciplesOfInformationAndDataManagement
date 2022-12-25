package data.datamanagement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;
public class ApplicationDB {
	
	public ApplicationDB(){
		
	}
	public Connection getConnection(){
		
		//Create a connection string
		String connectionUrl = "jdbc:mysql://localhost:3306/auction?autoReconnect=true&useSSL=false";
		Connection connection = null;
		
		try {
			//Load JDBC driver - the interface standardizing the connection procedure. Look at WEB-INF\lib for a mysql connector jar file, otherwise it fails.
			Class.forName("com.mysql.jdbc.Driver").newInstance();
		} catch (InstantiationException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			//Create a connection to your DB

			connection = DriverManager.getConnection(connectionUrl, "root", "root");

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return connection;
		
	}
	
	public void closeConnection(Connection connection){
		try {
			connection.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public void insertItemBelongsToSelling(String name, String status, String color, String category, String description, String owner)throws SQLException{
		
		Connection dbConnection = getConnection();
		
		int item_ID = Integer.parseInt(getNewItemID()) + 1;
		
		PreparedStatement ps2 = dbConnection.prepareStatement("insert into ItemBelongsToSelling ( name, status, color, item_ID, category_name, description, owner ) values ( ?,?,?,?,?,?,? )");
		ps2.setString(1, name);
		ps2.setString(2, status);
		ps2.setString(3, color);
		ps2.setInt(4, item_ID);
		ps2.setString(5, category);
		ps2.setString(6, description);
		ps2.setString(7, owner);
		ps2.executeUpdate();
		ps2.close();
		
		dbConnection.close();
	}
	
	public void insertAuction(java.sql.Timestamp startTime, java.sql.Timestamp endTime, int currentBid, int bidIncrement, int minPrice, int initialPrice, String email, int item_ID) throws SQLException{
		
		Connection dbConnection = getConnection();
		
		int auctionID = Integer.parseInt(getNewAuctionID()) + 1;
		
		PreparedStatement preparedStatement = dbConnection.prepareStatement("insert into AuctionCreates ( startTime, endTime, currentBid, bidIncrement, minPrice, initialPrice, auction_ID, email, item_ID, winner) " + "values ( ?,?,?,?,?,?,?,?,?,? )");
		
		preparedStatement.setTimestamp(1, startTime);
		preparedStatement.setTimestamp(2, endTime);
		preparedStatement.setInt(3, currentBid);
		preparedStatement.setInt(4, bidIncrement);
		preparedStatement.setInt(5, minPrice);
		preparedStatement.setInt(6, initialPrice);
		preparedStatement.setInt(7, auctionID);
		preparedStatement.setString(8, email);
		preparedStatement.setInt(9, item_ID);
		preparedStatement.setString(10, "No Bids Yet");
		
		preparedStatement.executeUpdate();
		
		preparedStatement.close();
		dbConnection.close();
	}
	
	private String getNewItemID()throws SQLException{
		Connection dbConnection = getConnection();
		PreparedStatement ps = dbConnection.prepareStatement("Select MAX(item_ID)max from ItemBelongsToSelling;");
		ResultSet RS = ps.executeQuery();
		String newID = "";
		while(RS.next())
			newID = RS.getString("max");
		
		if(newID == null)
			return "0";
		return newID;
	}
	
	private String getNewAuctionID()throws SQLException{
		Connection dbConnection = getConnection();
		PreparedStatement ps = dbConnection.prepareStatement("Select MAX(auction_ID)max from AuctionCreates;");
		ResultSet RS = ps.executeQuery();
		String newID = "";
		while(RS.next())
			newID = RS.getString("max");
		
		if(newID == null)
			return "0";
		return newID;
	}
	
	public void insertCategorySubCategory_1SubCategory_2SubCategory_3(String category, String subcategory) throws SQLException {
		Connection dbConnection = getConnection();
		
		PreparedStatement ps = dbConnection.prepareStatement("Insert into CategorySubCategory_1SubCategory_2SubCategory_3 (category_name, subcategory_name, item_ID) values ( ?,?,? )");
		ps.setString(1, category);
		ps.setString(2, subcategory);
		
		int item_ID = Integer.parseInt(getNewItemID());
		ps.setInt(3,  item_ID);
		
		ps.executeUpdate();
		ps.close();
		
		dbConnection.close();
	}
	
	public void insertBidOnPlaces(int amount, int auction_ID, String email, int upper_limit) throws SQLException{
		
		Connection dbConnection = getConnection();
		
		int bidID = Integer.parseInt(getNewBidID()) + 1;
		
		PreparedStatement preparedStatement = dbConnection.prepareStatement("insert into BidOnPlaces (bid_ID, amount, auction_ID, email, upper_limit) " + "values ( ?,?,?,?,? )");
		
		preparedStatement.setInt(1, bidID);
		preparedStatement.setInt(2, amount);
		preparedStatement.setInt(3, auction_ID);
		preparedStatement.setString(4, email);
		preparedStatement.setInt(5, upper_limit);
		
		preparedStatement.executeUpdate();
		
		preparedStatement.close();
		dbConnection.close();
	}
	
	private String getNewBidID()throws SQLException{
		Connection dbConnection = getConnection();
		PreparedStatement ps = dbConnection.prepareStatement("Select MAX(bid_ID)max from BidOnPlaces;");
		ResultSet RS = ps.executeQuery();
		String newID = "";
		while(RS.next())
			newID = RS.getString("max");
		
		if(newID == null)
			return "0";
		return newID;
	}
	
	public static void main(String[] args) {
		ApplicationDB dao = new ApplicationDB();
		Connection connection = dao.getConnection();
		
		System.out.println(connection);		
		dao.closeConnection(connection);
	}
	
	
}