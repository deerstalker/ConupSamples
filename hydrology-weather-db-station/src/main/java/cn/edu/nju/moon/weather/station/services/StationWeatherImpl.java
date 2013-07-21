package cn.edu.nju.moon.weather.station.services;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Logger;

import org.oasisopen.sca.annotation.Service;

import cn.edu.nju.moon.conup.spi.datamodel.ConupTransaction;
import cn.edu.nju.moon.weather.station.database.DatabaseConnector;

@Service(StationWeather.class)
public class StationWeatherImpl implements StationWeather {
	private static Logger LOGGER = Logger.getLogger(StationWeatherImpl.class.getName());
	
	@ConupTransaction
	public String getStationWeather(String station, String time) {
		
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
			String sql = "select id, WEATHER_, TEMPERATURE_, WIND_ from STATIONWEATHERINFO, STATIONINFO  where TIME_ = ? and STATIONINFO.ALIAS_ = ? and STATIONINFO.ID_ = STATIONWEATHERINFO.STATIONID_";
			PreparedStatement statement = conn.prepareStatement(sql);
			// "2012-08-08 09:00:00"
			String[] timeString = time.split(" ");
			time = timeString[0] + " " + "00:00:00";
			statement.setString(1, time);
			// "台州"
			statement.setString(2, station);
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
//		LOGGER.info(result);
		return result;
	}

}
