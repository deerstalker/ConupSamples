package cn.edu.nju.moon.station.proc.services;

import org.oasisopen.sca.annotation.Remotable;

@Remotable
public interface Auth {

	public String getToken();
		
}
