package cn.edu.nju.moon.station.db.services;

import java.io.UnsupportedEncodingException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Logger;

import org.oasisopen.sca.annotation.Service;

import cn.edu.nju.moon.conup.spi.datamodel.ConupTransaction;
import cn.edu.nju.moon.station.db.database.DatabaseConnector;

@Service(DBService.class)
public class DBServiceImpl implements DBService{

	private static final Logger LOGGER = Logger.getLogger(DBService.class.getName());

	/*
	 * (non-Javadoc)
	 * @see cn.edu.nju.moon.station.db.services.DBService#getStationInfo(java.lang.String)
	 * DROP TABLE IF EXISTS `STATIONINFO`;
CREATE TABLE `STATIONINFO`(
	`ID_` int(10) unsigned NOT NULL,
	`NAME_` varchar(80) character set utf8 NOT NULL default '',
	`ALIAS_` varchar(80) NOT NULL default '',
	`TYPE_` int unsigned,
	`RVNM_` varchar(30),
	`HNNM_` varchar(30),
	`DRNA_` int,
	PRIMARY KEY  (`ID_`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;
	 */
	@ConupTransaction
	public String getStationInfo(String stationId, String token) {
		// TODO Auto-generated method stub
		String result = "";
		try {
			Connection conn = DatabaseConnector.INSTANCES.getConnection();
			if (conn.isClosed()) {
				// System.out.println("Succeeded connecting to the Database!");
				result = "not connected";
			}
			String sql = "select * from STATIONINFO where ID_ = ?";
			PreparedStatement statement = conn.prepareStatement(sql);
			statement.setString(1, stationId);
			ResultSet tResultSet = statement.executeQuery();
			if (tResultSet.next()) {
				result = tResultSet.getString("RVNM_") + "#" + tResultSet.getString("HNNM_") + "#" 
						+ tResultSet.getString("DRNA_");
			}
			if(token.equals("level2")){
				//query video
				result = result + "#" + tResultSet.getString("VIDEOURL_");
			}
			else if(token.equals("level1")){
				result = result + "#";
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
		try {
			result = new String(result.getBytes("UTF-8"),"ISO-8859-1");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}
	

}
