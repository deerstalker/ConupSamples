package cn.edu.nju.moon.weather.intergration.services.typhoon;

import org.oasisopen.sca.annotation.Remotable;

@Remotable
public interface TyphoonService {
	public String getTyphoon(String flag);
}
