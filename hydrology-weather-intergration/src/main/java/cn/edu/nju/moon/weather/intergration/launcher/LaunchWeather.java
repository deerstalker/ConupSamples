package cn.edu.nju.moon.weather.intergration.launcher;

import java.util.logging.Logger;

import org.apache.tuscany.sca.contribution.processor.ContributionReadException;
import org.apache.tuscany.sca.monitor.ValidationException;
import org.apache.tuscany.sca.runtime.ActivationException;

import cn.edu.nju.moon.weather.intergration.launcher.ComponentLaunch;

public class LaunchWeather {
	private static Logger LOGGER = Logger.getLogger(LaunchWeather.class.getName());

	/**
	 * distributed.
	 * 
	 * @param args
	 * @throws Exception
	 */
	public static void main(String[] args){
		ComponentLaunch dbComponentLaunch = new ComponentLaunch(
				"/home/deerstalker/conup/conup-read-only/samples/hydrology-weather-intergration/target/classes",
				"hydrology-weather-intergration", "App.composite", "WeatherIntergrationComponent");
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
