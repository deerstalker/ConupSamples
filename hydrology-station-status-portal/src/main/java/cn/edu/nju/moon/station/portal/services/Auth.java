package cn.edu.nju.moon.station.portal.services;

import org.oasisopen.sca.annotation.Remotable;

@Remotable
public interface Auth {

	public String getToken();
		
}
