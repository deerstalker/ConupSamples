package cn.edu.nju.moon.weather.intergration.services.weatherReport;

import org.oasisopen.sca.annotation.Remotable;

@Remotable
public interface Weather {
	public String getWeather(String name, String time);
		
}
