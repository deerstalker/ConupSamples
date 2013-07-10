package cn.edu.nju.moon.intergration.rainfall.station;

import org.oasisopen.sca.annotation.Remotable;

@Remotable
public interface StationRfWSService {
	String getWSStationRf(String station, String time);
}
