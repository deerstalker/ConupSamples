package cn.edu.nju.moon.station.auth;

import org.oasisopen.sca.annotation.Remotable;

@Remotable
public interface Auth {

	public String getToken();
		
}
