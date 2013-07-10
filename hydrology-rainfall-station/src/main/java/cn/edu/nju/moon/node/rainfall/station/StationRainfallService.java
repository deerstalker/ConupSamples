package cn.edu.nju.moon.node.rainfall.station;

import org.oasisopen.sca.annotation.Remotable;

@Remotable
public interface StationRainfallService 
{
	String getNodeStationRf(String station, String time);
}
