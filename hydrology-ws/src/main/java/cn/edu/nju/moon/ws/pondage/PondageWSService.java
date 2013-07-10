package cn.edu.nju.moon.ws.pondage;

import org.oasisopen.sca.annotation.Remotable;

@Remotable
public interface PondageWSService {
	String getWSPondage(String station, String time);
}
