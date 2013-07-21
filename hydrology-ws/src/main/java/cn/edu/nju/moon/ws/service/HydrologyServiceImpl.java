package cn.edu.nju.moon.ws.service;

import org.oasisopen.sca.annotation.Reference;
import org.oasisopen.sca.annotation.Service;

import cn.edu.nju.moon.conup.spi.datamodel.ConupTransaction;
import cn.edu.nju.moon.ws.pondage.PondageService;
import cn.edu.nju.moon.ws.pondage.PondageWSService;
import cn.edu.nju.moon.ws.rainfall.city.CityRainfallService;
import cn.edu.nju.moon.ws.rainfall.city.CityRfWSService;
import cn.edu.nju.moon.ws.rainfall.station.StationRainfallService;
import cn.edu.nju.moon.ws.rainfall.station.StationRfWSService;

@Service({PondageWSService.class, CityRfWSService.class, StationRfWSService.class})
public class HydrologyServiceImpl implements PondageWSService, CityRfWSService, StationRfWSService{

	private PondageService nodePondage;
	private CityRainfallService nodeCityRf;
	private StationRainfallService nodeStationRf;
	
	@Reference
	public void setNodeCityRf(CityRainfallService nodeCityRf){
		this.nodeCityRf = nodeCityRf;
	}
	public CityRainfallService getNodeCityRf(){
		return nodeCityRf;
	}
	
	@Reference
	public void setNodeStationRf(StationRainfallService nodeStationRf){
		this.nodeStationRf = nodeStationRf;
	}
	public StationRainfallService getNodeStationRf(){
		return nodeStationRf;
	}
	@Reference
	public void setNodePondage(PondageService nodePondage){
		this.nodePondage = nodePondage; 
	}
	public PondageService getNodePondage(){
		return nodePondage;
	}
	@ConupTransaction
	public String getWSPondage(String station, String time) {
		// TODO Auto-generated method stub
		return nodePondage.getNodePondage(station, time);
	}
	@ConupTransaction
	public String getWSStationRf(String station, String time) {
		// TODO Auto-generated method stub
		return nodeStationRf.getNodeStationRf(station, time);
	}
	@ConupTransaction
	public String getWSCityRf(String city, String time) {
		// TODO Auto-generated method stub
		return nodeCityRf.getNodeCityRf(city, time);
	}
   
}
