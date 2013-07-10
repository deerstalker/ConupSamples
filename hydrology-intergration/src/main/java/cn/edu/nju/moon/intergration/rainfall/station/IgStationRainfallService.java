package cn.edu.nju.moon.intergration.rainfall.station;

import org.oasisopen.sca.annotation.Remotable;

@Remotable
public interface IgStationRainfallService 
{
	String getStationRf(String station, String time);
}
