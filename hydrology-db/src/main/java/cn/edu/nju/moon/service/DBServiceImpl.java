package cn.edu.nju.moon.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.oasisopen.sca.annotation.Service;

import cn.edu.nju.moon.conup.spi.datamodel.ConupTransaction;
import cn.edu.nju.moon.database.DatabaseConnector;
import cn.edu.nju.moon.rain.city.CityRainfall;
import cn.edu.nju.moon.rain.station.StationRainfall;
import cn.edu.nju.moon.water.Pondage;

@Service({ CityRainfall.class, StationRainfall.class, Pondage.class })
public class DBServiceImpl implements CityRainfall, StationRainfall, Pondage{

	@ConupTransaction
	public String getPondage(String station, String time) {
		// TODO Auto-generated method stub
		String result = "";
   		try {
   			Connection conn = DatabaseConnector.INSTANCES.getConnection();
   			if(conn.isClosed()){
   				//System.out.println("Succeeded connecting to the Database!");
   				result = "notconnected";
   			}
//   			Statement statement = conn.createStatement();
   			String sql = "select WATERLEVEL_ from pondage, stationinfo  where TIME_ = ? and stationinfo.ALIAS_ = ? and stationinfo.ID_ = pondage.STATIONID_";
   			PreparedStatement statement = conn.prepareStatement(sql);
//			"2012-08-08 09:00:00"
   			statement.setString(1, time);
//			"台州"
   			statement.setString(2, station);
   			ResultSet tResultSet = statement.executeQuery();
   			while(tResultSet.next()){
   				result += tResultSet.getString("WATERLEVEL_");
   			}
   			tResultSet.close();
   			conn.close();
   		}catch(SQLException e){
   			//do something
   			e.printStackTrace();
   		}catch(Exception e){
   			//do something
   			e.printStackTrace();
   		}
   		return result;
	}

	@ConupTransaction
	public String getStationRainfall(String station, String time) {
		// TODO Auto-generated method stub
		String result = "";
   		try {
   			Connection conn = DatabaseConnector.INSTANCES.getConnection();
   			if(conn.isClosed()){
   				//System.out.println("Succeeded connecting to the Database!");
   				result = "notconnected";
   			}
//   			Statement statement = conn.createStatement();
   			String sql = "select AMOUNT_ from stationrainfall, stationinfo  where TIME_ = ? and stationinfo.ALIAS_ = ? and stationinfo.ID_ = stationrainfall.STATIONID_";
   			PreparedStatement statement = conn.prepareStatement(sql);
//			"2012-08-08 09:00:00"
   			statement.setString(1, time);
//			"台州"
   			statement.setString(2, station);
   			ResultSet tResultSet = statement.executeQuery();
   			while(tResultSet.next()){
   				result += tResultSet.getString("AMOUNT_");
   			}
   			tResultSet.close();
   			conn.close();
   		}catch(SQLException e){
   			//do something
   			e.printStackTrace();
   		}catch(Exception e){
   			//do something
   			e.printStackTrace();
   		}
   		return result;
	}

	@ConupTransaction
	public String getCityRainfall(String city, String time) {
		// TODO Auto-generated method stub
		String result = "";
   		try {
   			Connection conn = DatabaseConnector.INSTANCES.getConnection();
   			if(conn.isClosed()){
   				//System.out.println("Succeeded connecting to the Database!");
   				result = "notconnected";
   			}
//   			Statement statement = conn.createStatement();
   			String sql = "select AMOUNT_ from rainfall, city  where TIME_ = ? and city.ALIAS_ = ? and city.ID_ = rainfall.CITYID_";
   			PreparedStatement statement = conn.prepareStatement(sql);
//			"2012-08-08 09:00:00"
   			statement.setString(1, time);
//			"台州"
   			statement.setString(2, city);
   			ResultSet tResultSet = statement.executeQuery();
   			while(tResultSet.next()){
   				result += tResultSet.getString("AMOUNT_");
   			}
   			tResultSet.close();
   			conn.close();
   		}catch(SQLException e){
   			//do something
   			e.printStackTrace();
   		}catch(Exception e){
   			//do something
   			e.printStackTrace();
   		}
   		return result;
	}

}
