package data.datamanagement;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class AlertManager {

	ApplicationDB db;

	public AlertManager() {
		db = new ApplicationDB();
	}

	public ArrayList<Integer> getItemIDs(String email) throws SQLException {
		ArrayList<Integer> ids = new ArrayList<Integer>();

		Connection connection = db.getConnection();
		Statement statement = connection.createStatement();

		ResultSet results = statement
				.executeQuery("select item_ID from ItemBelongsToSelling where owner!='" + email + "';");

		while (results.next()) {
			ids.add(results.getInt(1));
		}

		System.out.println(ids);

		return ids;
	}

	/**
	 * Checks if the alert exists and if not, then adds to the list of alerts. Also
	 * checks if the item exists or not.
	 * 
	 * @param email
	 * @param itemID
	 * @return
	 * @throws SQLException
	 */
	public String createAlert(String email, String itemID) throws SQLException {

		int item_ID = Integer.parseInt(itemID);

		Connection dbConnection = db.getConnection();

		Connection connection = db.getConnection();
		Statement statement = connection.createStatement();

		ResultSet results = statement
				.executeQuery("SELECT * FROM Alerts WHERE email='" + email + "' and item_ID='" + itemID + "';");

		if (results.next()) {
			return "Alert Already Exists!";
		}

		if (!getItemIDs(email).contains(item_ID)) {
			return "Invalid Item Number";
		}

		PreparedStatement preparedStatement = dbConnection
				.prepareStatement("insert into Alerts (email, item_ID) " + "values ( ?, ?);");

		preparedStatement.setString(1, email);
		preparedStatement.setInt(2, item_ID);

		preparedStatement.executeUpdate();
		preparedStatement.close();
		dbConnection.close();

		return "Successfully Added Alert";
	}

	public boolean getItemAvailable(int id) throws SQLException {
		Connection connection = db.getConnection();
		Statement statement = connection.createStatement();

		String query = String.format("select item_ID " + "from AuctionCreates "
				+ "where item_ID=%s", id);

		ResultSet results = statement.executeQuery(query);

		while (results.next()) {
			return true;
		}

		connection.close();
		
		return false;

	}

	public String getAlerts(String email) throws SQLException {

		String total = "<table border=1><tr><th>Item ID</th><th>Auction Availability</th></tr>";

		String query = String.format("select item_ID "
				+ "from Alerts "
				+ "where email='%s'", email);
		Connection c = db.getConnection();
		Statement s = c.createStatement();
		ResultSet r = s.executeQuery(query);
		
		while(r.next()) {
			int itemID = r.getInt(1);
			
			if(getItemAvailable(itemID)) { // Check if it is available for auction.
				total += "<tr><td>" + itemID + "</td><td>Available</td></tr>";
			} else {
				total += "<tr><td>" + itemID + "</td><td>Unavailable</td></tr>";
			}
		}

		c.close();
		
		total += "</table>";

		return total;
	}

}
