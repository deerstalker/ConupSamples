package cn.edu.nju.moon.station.db.launcher;

import java.util.logging.Logger;

import org.apache.tuscany.sca.contribution.processor.ContributionReadException;
import org.apache.tuscany.sca.monitor.ValidationException;
import org.apache.tuscany.sca.runtime.ActivationException;

import cn.edu.nju.moon.station.db.launcher.ComponentLaunch;

public class LaunchStationDB {
	private static Logger LOGGER = Logger.getLogger(LaunchStationDB.class.getName());

	/**
	 * distributed.
	 * 
	 * @param args
	 * @throws Exception
	 */
	public static void main(String[] args){
		ComponentLaunch dbComponentLaunch = new ComponentLaunch(
				"/home/deerstalker/conup/conup-read-only/samples/hydrology-station-status-db/target/classes",
				"hydrology-station-status-db", "App.composite", "HydrologyStationDBComponent");
		try {
			dbComponentLaunch.startNode();
		} catch (ContributionReadException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ValidationException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ActivationException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
