package cn.edu.nju.moon.node.rainfall.city;

import org.oasisopen.sca.annotation.Reference;
import org.oasisopen.sca.annotation.Remotable;
import org.oasisopen.sca.annotation.Service;

import cn.edu.nju.moon.conup.spi.datamodel.ConupTransaction;

@Service(CityRainfallService.class)
public class CityRainfallServiceImpl implements CityRainfallService{
	
	CityRainfall cityRf;
	@Reference
	public void setCityRf(CityRainfall cityRf){
		this.cityRf = cityRf;
	}
	public CityRainfall getCityRf(){
		return cityRf;
	}
	

	@ConupTransaction
	public String getNodeCityRf(String city, String time) {
		// TODO Auto-generated method stub
		return cityRf.getCityRainfall(city, time);
	}
}
