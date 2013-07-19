package cn.edu.nju.moon.weather.city.launcher;

import java.util.logging.Logger;

import org.apache.tuscany.sca.contribution.processor.ContributionReadException;
import org.apache.tuscany.sca.monitor.ValidationException;
import org.apache.tuscany.sca.runtime.ActivationException;

import cn.edu.nju.moon.weather.city.launcher.ComponentLaunch;

public class LaunchCityWeather {
	private static Logger LOGGER = Logger.getLogger(LaunchCityWeather.class.getName());

	/**
	 * distributed.
	 * 
	 * @param args
	 * @throws Exception
	 */
	public static void main(String[] args){
		ComponentLaunch dbComponentLaunch = new ComponentLaunch(
				"/home/deerstalker/conup/conup-read-only/samples/hydrology-weather-db-city/target/classes",
				"hydrology-weather-db-city", "App.composite", "DBCityWeatherComponent");
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
