package cn.edu.nju.moon.station.portal.services;

import org.oasisopen.sca.annotation.Remotable;

@Remotable
public interface Portal {
	public String execute(String stationId);
}
