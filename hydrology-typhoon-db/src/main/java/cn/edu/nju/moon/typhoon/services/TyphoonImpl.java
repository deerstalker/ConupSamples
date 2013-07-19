package cn.edu.nju.moon.typhoon.services;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Logger;

import org.oasisopen.sca.annotation.Service;

import cn.edu.nju.moon.conup.spi.datamodel.ConupTransaction;
import cn.edu.nju.moon.typhoon.database.DatabaseConnector;

@Service(Typhoon.class)
public class TyphoonImpl implements Typhoon {
	private static Logger LOGGER = Logger.getLogger(TyphoonImpl.class.getName());
	

/*
 * (non-Javadoc)
 * @see cn.edu.nju.moon.typhoon.services.Typhoon#getTyPhoonInfo(float)
 * CREATE TABLE `TYPHOONINFO` (
	`id` int(10) unsigned NOT NULL auto_increment,
	`TIME_` datetime default '0000-00-00 00:00:00',
	`LONGITUDE_` float,
	`LATITUDE_` float,
	`PRESSURE_` varchar(30),
	`MAXIMUMWINDSPEED_` varchar(30),
	`GALERADIUS_` varchar(30),
	`WHOLEGALERADIUS_` varchar(30),
	`WARNLEVEL_` varchar(20),
	`FLAG_` float,
	PRIMARY KEY (`id`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;
 */
	@ConupTransaction
	public String getTyPhoonInfo(String flag) {
		// TODO Auto-generated method stub
		String result = "";
		try {
			Connection conn = DatabaseConnector.INSTANCES.getConnection();
			if (conn.isClosed()) {
				// System.out.println("Succeeded connecting to the Database!");
				result = "not connected";
			}
			String sql = "select * from TYPHOONINFO where FLAG_ = ?";
			PreparedStatement statement = conn.prepareStatement(sql);
			statement.setString(1, flag);
			ResultSet tResultSet = statement.executeQuery();
			if (tResultSet.next()) {
				result = tResultSet.getString("ID_");
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
