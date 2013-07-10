package cn.edu.nju.moon.intergration.rainfall.city;

import org.oasisopen.sca.annotation.Remotable;

@Remotable
public interface IgCityRainfallService 
{
	String getCityRf(String city, String time);
}
