package cn.edu.nju.moon.node.rainfall.city;

import org.oasisopen.sca.annotation.Remotable;

@Remotable
public interface CityRainfallService 
{
	String getNodeCityRf(String city, String time);
}
