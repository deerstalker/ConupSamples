package cn.edu.nju.moon.ws.pondage;

import org.oasisopen.sca.annotation.Remotable;

@Remotable
public interface PondageService 
{
   String getNodePondage(String station, String time);
}
