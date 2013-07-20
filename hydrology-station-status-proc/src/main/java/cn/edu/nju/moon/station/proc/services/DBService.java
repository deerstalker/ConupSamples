package cn.edu.nju.moon.station.proc.services;

import org.oasisopen.sca.annotation.Remotable;

@Remotable
public interface DBService {
	public String getStationInfo(String stationId, String token);
}
