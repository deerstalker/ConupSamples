package cn.edu.nju.moon.node.rainfall.station;

import org.oasisopen.sca.annotation.Reference;
import org.oasisopen.sca.annotation.Remotable;
import org.oasisopen.sca.annotation.Service;

import cn.edu.nju.moon.conup.spi.datamodel.ConupTransaction;

@Service(StationRainfallService.class)
public class StationRainfallServiceImpl implements StationRainfallService{
	
	StationRainfall stationRf;
	@Reference
	public void setStationRf(StationRainfall stationRf){
		this.stationRf = stationRf;
	}
	public StationRainfall getStationRf(){
		return stationRf;
	}
	
	@ConupTransaction
	public String getNodeStationRf(String station, String time) {
		// TODO Auto-generated method stub
		return stationRf.getStationRainfall(station, time);
	}
}
