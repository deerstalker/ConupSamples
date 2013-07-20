package cn.edu.nju.moon.station.portal.launcher;

import java.util.logging.Logger;

import org.apache.tuscany.sca.contribution.processor.ContributionReadException;
import org.apache.tuscany.sca.monitor.ValidationException;
import org.apache.tuscany.sca.runtime.ActivationException;

import cn.edu.nju.moon.station.portal.launcher.ComponentLaunch;

public class LaunchStationPortal {
	private static Logger LOGGER = Logger.getLogger(LaunchStationPortal.class.getName());

	/**
	 * distributed.
	 * 
	 * @param args
	 * @throws Exception
	 */
	public static void main(String[] args){
		ComponentLaunch dbComponentLaunch = new ComponentLaunch(
				"/home/deerstalker/conup/conup-read-only/samples/hydrology-station-status-portal/target/classes",
				"hydrology-station-status-portal", "App.composite", "HydrologyStationPortalComponent");
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
