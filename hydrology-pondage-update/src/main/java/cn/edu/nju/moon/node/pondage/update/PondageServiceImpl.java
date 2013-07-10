package cn.edu.nju.moon.node.pondage.update;

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
		/*
		 * time format:2012-08-08 22:00:00
		 */
		String[] splitString = time.split(" ");
		String[] timeStrings = splitString[1].split(":");
		int hour = Integer.parseInt(timeStrings[0]);
		int minute = Integer.parseInt(timeStrings[1]);
		if(minute == 0){
			if(hour != 0){
				hour = hour - 1;
			}
		}
		else{
			minute = minute - 20;
		}
		String formerTime = splitString[0] + " " + hour + ":" + minute + ":" +"00";
		double formerResult = Double.parseDouble(dbPondage.getPondage(station, formerTime));
		double currentResult = Double.parseDouble(dbPondage.getPondage(station, time));
		double increaseRate = (currentResult - formerResult)/formerResult;
		return ""+ currentResult + "&" + increaseRate;
	}
	
}
