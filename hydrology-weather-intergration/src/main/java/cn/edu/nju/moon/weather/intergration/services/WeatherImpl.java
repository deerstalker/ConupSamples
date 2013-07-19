package cn.edu.nju.moon.weather.intergration.services;

import org.oasisopen.sca.annotation.Reference;
import org.oasisopen.sca.annotation.Service;

import cn.edu.nju.moon.conup.spi.datamodel.ConupTransaction;

@Service(Weather.class)
public class WeatherImpl implements Weather{

	CityWeather mCityWeather;
	StationWeather mStationWeather;
	
	@Reference
	public void setMCityWeather(CityWeather mCityWeather){
		this.mCityWeather = mCityWeather; 
	}
	public CityWeather getMCityWeather(){
		return mCityWeather;
	}
	
	@Reference
	public StationWeather getMStationWeather(){
		return mStationWeather;
	}
	public void setMStationWeather(StationWeather mStationWeather){
		this.mStationWeather = mStationWeather;
	}
	
	@ConupTransaction
	public String getWeather(String name, String time) {
		// TODO Auto-generated method stub
		String result = mCityWeather.getCityWeather(name, time);
		if(result.equals("")){
			result = mStationWeather.getStationWeather(name, time);
		}
		return result;
	}

}
