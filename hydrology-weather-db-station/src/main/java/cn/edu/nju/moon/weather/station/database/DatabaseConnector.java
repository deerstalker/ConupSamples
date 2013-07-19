package cn.edu.nju.moon.weather.station.database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;

import org.logicalcobwebs.proxool.ProxoolException;
import org.logicalcobwebs.proxool.ProxoolFacade;
public enum DatabaseConnector {
	INSTANCES;
	DatabaseConnector() {
		// TODO Auto-generated constructor stub
		
		try {
			Class.forName("org.logicalcobwebs.proxool.ProxoolDriver");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		Properties info = new Properties();
		info.setProperty("proxool.maximum-connection-count", "10");
		info.setProperty("proxool.house-keeping-test-sql", "select CURRENT_DATE");
		info.setProperty("user", "root");
		info.setProperty("password", "njueducn");
		String alias = "weather-station";
		String driverClass = "com.mysql.jdbc.Driver";
		String driverUrl = "jdbc:mysql://114.212.86.206:3306/HYDROLOGY";
		String url = "proxool." + alias + ":" + driverClass + ":" + driverUrl;
		try {
			ProxoolFacade.registerConnectionPool(url, info);
		} catch (ProxoolException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public Connection getConnection(){
		Connection connection = null;
		try {
			connection = DriverManager.getConnection("proxool.weather-station");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return connection;
	}
}
