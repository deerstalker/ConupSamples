package cn.edu.nju.moon.weather.intergration.services;

import java.util.logging.Logger;

import org.oasisopen.sca.annotation.Reference;
import org.oasisopen.sca.annotation.Service;

import cn.edu.nju.moon.conup.spi.datamodel.ConupTransaction;

@Service(Weather.class)
public class WeatherImpl implements Weather {
	private static Logger logger = Logger.getLogger(Weather.class.getName());
	private CityWeather mCityWeather;
	private StationWeather mStationWeather;

	@ConupTransaction
	public String getWeather(String name, String time) {
		// TODO Auto-generated method stub
		
		String result = mCityWeather.getCityWeather(name, time);
		String prefix = "city";
		if (result.equals("")) {
			result = mStationWeather.getStationWeather(name, time);
			prefix = "station";
		}
		result = prefix + "#" + result;
		logger.info(result);
		return result;
	}

	public CityWeather getmCityWeather() {
		return mCityWeather;
	}

	@Reference
	public void setmCityWeather(CityWeather mCityWeather) {
		this.mCityWeather = mCityWeather;
	}

	public StationWeather getmStationWeather() {
		return mStationWeather;
	}

	@Reference
	public void setmStationWeather(StationWeather mStationWeather) {
		this.mStationWeather = mStationWeather;
	}

}
