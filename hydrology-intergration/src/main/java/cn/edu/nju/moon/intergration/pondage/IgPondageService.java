package cn.edu.nju.moon.intergration.pondage;

import org.oasisopen.sca.annotation.Remotable;

@Remotable
public interface IgPondageService 
{
   String getPondage(String station, String time);
}
