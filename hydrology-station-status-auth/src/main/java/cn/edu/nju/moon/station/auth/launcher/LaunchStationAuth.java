package cn.edu.nju.moon.station.auth.launcher;

import java.util.logging.Logger;

import org.apache.tuscany.sca.contribution.processor.ContributionReadException;
import org.apache.tuscany.sca.monitor.ValidationException;
import org.apache.tuscany.sca.runtime.ActivationException;

import cn.edu.nju.moon.station.auth.launcher.ComponentLaunch;

public class LaunchStationAuth {
	private static Logger LOGGER = Logger.getLogger(LaunchStationAuth.class.getName());

	/**
	 * distributed.
	 * 
	 * @param args
	 * @throws Exception
	 */
	public static void main(String[] args){
		ComponentLaunch dbComponentLaunch = new ComponentLaunch(
				"/home/deerstalker/conup/conup-read-only/samples/hydrology-station-status-auth/target/classes",
				"hydrology-station-status-auth", "App.composite", "HydrologyStationAuthComponent");
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
