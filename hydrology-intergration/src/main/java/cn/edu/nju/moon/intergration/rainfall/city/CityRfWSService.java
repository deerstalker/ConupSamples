package cn.edu.nju.moon.intergration.rainfall.city;

import org.oasisopen.sca.annotation.Remotable;

@Remotable
public interface CityRfWSService {
	String getWSCityRf(String city, String time);
}
