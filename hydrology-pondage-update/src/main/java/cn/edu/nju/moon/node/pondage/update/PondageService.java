package cn.edu.nju.moon.node.pondage.update;

import org.oasisopen.sca.annotation.Remotable;

@Remotable
public interface PondageService 
{
   String getNodePondage(String station, String time);
}
