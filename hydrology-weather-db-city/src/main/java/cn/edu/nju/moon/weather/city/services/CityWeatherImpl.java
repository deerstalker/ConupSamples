package cn.edu.nju.moon.weather.city.services;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Logger;

import org.oasisopen.sca.annotation.Service;

import cn.edu.nju.moon.conup.spi.datamodel.ConupTransaction;
import cn.edu.nju.moon.weather.city.database.DatabaseConnector;

@Service(CityWeather.class)
public class CityWeatherImpl implements CityWeather {
	private static Logger LOGGER = Logger.getLogger(CityWeatherImpl.class.getName());
	
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
			String sql = "select id, WEATHER_, TEMPERATURE_, WIND_ from CITYWEATHERINFO, city  where TIME_ = ? and city.ALIAS_ = ? and city.ID_ = CITYWEATHERINFO.CITYID_";
			PreparedStatement statement = conn.prepareStatement(sql);
			// content like: "2012-08-08 09:00:00"
			statement.setString(1, time);
			// content like: "台州"
			statement.setString(2, city);
			ResultSet tResultSet = statement.executeQuery();
			if (tResultSet.next()) {
				result = tResultSet.getString("id") + "#" + tResultSet.getString("WEATHER_") + "#" + tResultSet.getString("TEMPERATURE_") + "#" + tResultSet.getString("WIND_");
//				result = tResultSet.getString("id");
				result = new String(result.getBytes("UTF-8"),"ISO-8859-1");
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
		return result;
	}

}
