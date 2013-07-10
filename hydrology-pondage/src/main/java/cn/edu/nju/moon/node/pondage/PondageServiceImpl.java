package cn.edu.nju.moon.node.pondage;

import org.oasisopen.sca.annotation.Reference;
import org.oasisopen.sca.annotation.Service;

import cn.edu.nju.moon.conup.spi.datamodel.ConupTransaction;

@Service(PondageService.class)
public class PondageServiceImpl implements PondageService{

	
	
	private Pondage dbPondage;
	
	@Reference
	public void setDbPondage(Pondage dbPondage){
		this.dbPondage = dbPondage;
	}
	public Pondage getDbPondage(){
		return dbPondage;
	}
	@ConupTransaction
	public String getNodePondage(String station, String time) {
		// TODO Auto-generated method stub
		return dbPondage.getPondage(station, time);
	}
	
}
