package cn.edu.nju.moon.intergration.service;

import org.oasisopen.sca.annotation.Reference;
import org.oasisopen.sca.annotation.Service;

import cn.edu.nju.moon.conup.spi.datamodel.ConupTransaction;
import cn.edu.nju.moon.intergration.pondage.IgPondageService;
import cn.edu.nju.moon.intergration.pondage.PondageWSService;
import cn.edu.nju.moon.intergration.rainfall.city.IgCityRainfallService;
import cn.edu.nju.moon.intergration.rainfall.city.CityRfWSService;
import cn.edu.nju.moon.intergration.rainfall.station.IgStationRainfallService;
import cn.edu.nju.moon.intergration.rainfall.station.StationRfWSService;

@Service({IgCityRainfallService.class, IgPondageService.class, IgStationRainfallService.class})
public class IgHydrologyServiceImpl implements IgCityRainfallService, IgStationRainfallService, IgPondageService
{

	PondageWSService wsPondage;
	CityRfWSService wsCityRf;
	StationRfWSService wsStationRf;
	
	@Reference
	public void setWsCityRf(CityRfWSService wsCityRf){
		this.wsCityRf = wsCityRf;
	}
	
	public CityRfWSService getWsCityRf(){
		return wsCityRf;
	}
	
	@Reference
	public void setWsStationRf(StationRfWSService wsStationRf){
		this.wsStationRf = wsStationRf;
	}
	public StationRfWSService getWsStationRf(){
		return wsStationRf;
	}
	@Reference
	public void setWsPondage(PondageWSService wsPondage){
		this.wsPondage = wsPondage; 
	}
	public PondageWSService getWsPondage(){
		return wsPondage;
	}
	
	@ConupTransaction
	public String getPondage(String station, String time) {
		// TODO Auto-generated method stub
		return wsPondage.getWSPondage(station, time);
	}
	
	@ConupTransaction
	public String getStationRf(String station, String time) {
		// TODO Auto-generated method stub
		return wsStationRf.getWSStationRf(station, time);
	}
	
	@ConupTransaction
	public String getCityRf(String city, String time) {
		// TODO Auto-generated method stub
		return wsCityRf.getWSCityRf(city, time);
	}
   
}
