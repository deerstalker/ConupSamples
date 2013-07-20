package cn.edu.nju.moon.weather.intergration.services;

import java.io.UnsupportedEncodingException;
import java.util.logging.Logger;

import org.oasisopen.sca.annotation.Reference;
import org.oasisopen.sca.annotation.Service;

import cn.edu.nju.moon.conup.spi.datamodel.ConupTransaction;
import cn.edu.nju.moon.weather.intergration.services.typhoon.Typhoon;
import cn.edu.nju.moon.weather.intergration.services.typhoon.TyphoonService;
import cn.edu.nju.moon.weather.intergration.services.weatherReport.CityWeather;
import cn.edu.nju.moon.weather.intergration.services.weatherReport.StationWeather;
import cn.edu.nju.moon.weather.intergration.services.weatherReport.Weather;

@Service({ Weather.class, TyphoonService.class })
public class WeatherImpl implements Weather, TyphoonService {
	private static Logger logger = Logger.getLogger(Weather.class.getName());
	private CityWeather mCityWeather;
	private StationWeather mStationWeather;
	private Typhoon mTyphoon;

	public Typhoon getmTyphoon() {
		return mTyphoon;
	}

	@Reference
	public void setmTyphoon(Typhoon mTyphoon) {
		this.mTyphoon = mTyphoon;
	}

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

	@ConupTransaction
	public String getTyphoon(String flag) {
		// TODO Auto-generated method stub
//		return mTyphoon.getTyPhoonInfo(flag);
		String resultString = mTyphoon.getTyPhoonInfo(flag);
		logger.info(resultString);
		try {
			String resultUTF8 = new String(resultString.getBytes("ISO-8859-1"),"UTF-8");
			logger.info(resultUTF8);
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return resultString;
	}

}
