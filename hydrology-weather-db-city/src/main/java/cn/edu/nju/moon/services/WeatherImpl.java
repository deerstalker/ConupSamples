package cn.edu.nju.moon.services;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Logger;

import org.oasisopen.sca.annotation.Service;

import cn.edu.nju.moon.conup.spi.datamodel.ConupTransaction;
import cn.edu.nju.moon.database.DatabaseConnector;

@Service(Weather.class)
public class WeatherImpl implements Weather {
	private static Logger LOGGER = Logger.getLogger(WeatherImpl.class.getName());
	
	@ConupTransaction
	public String getCityWeather(String city, String time) {
		
		// TODO Auto-generated method stub
		/*
		 * `id` int(10) unsigned NOT NULL auto_increment, 
		 * `CITYID_` int(10) unsigned, 
		 * `TIME_` datetime default '0000-00-00 00:00:00', 
		 * `WEATHER_` varchar(30), 
		 * `TEMPERATURE_` varchar(30), 
		 * `WIND_` varchar(30),
		 */
		String result = "";
		try {
			Connection conn = DatabaseConnector.INSTANCES.getConnection();
			if (conn.isClosed()) {
				// System.out.println("Succeeded connecting to the Database!");
				result = "notconnected";
			}
			// Statement statement = conn.createStatement();
			String sql = "select WEATHER_, TEMPERATURE_, WIND_ from CITYWEATHERINFO, city  where TIME_ = ? and city.ALIAS_ = ? and city.ID_ = CITYWEATHERINFO.CITYID_";
			PreparedStatement statement = conn.prepareStatement(sql);
			// "2012-08-08 09:00:00"
			statement.setString(1, time);
			// "台州"
			statement.setString(2, city);
			ResultSet tResultSet = statement.executeQuery();
			if (tResultSet.next()) {
				result = tResultSet.getString("WEATHER_") + "#" + tResultSet.getString("TEMPERATURE_") + "#" + tResultSet.getString("WIND_");
			}
			tResultSet.close();
			conn.close();
		} catch (SQLException e) {
			// do something
			e.printStackTrace();
		} catch (Exception e) {
			// do something
			e.printStackTrace();
		}
		LOGGER.info(result);
		String temp = "zhongguoren";
		return temp;
	}

}
