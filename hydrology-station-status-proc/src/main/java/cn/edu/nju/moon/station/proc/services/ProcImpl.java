package cn.edu.nju.moon.station.proc.services;

import org.oasisopen.sca.annotation.Reference;
import org.oasisopen.sca.annotation.Service;

import cn.edu.nju.moon.conup.spi.datamodel.ConupTransaction;

@Service(Proc.class)
public class ProcImpl implements Proc {

	private Auth auth;
	private DBService dbService;

	public Auth getAuth() {
		return auth;
	}

	@Reference
	public void setAuth(Auth auth) {
		this.auth = auth;
	}

	public DBService getDbService() {
		return dbService;
	}

	@Reference
	public void setDbService(DBService dbService) {
		this.dbService = dbService;
	}

	@ConupTransaction
	public String process(String stationId, String token) {
		// TODO Auto-generated method stub
		String tokenFromAuth = auth.getToken();
		if (token.equals(tokenFromAuth)) {
			return dbService.getStationInfo(stationId, token);
		} else {
			return "Token is illegal!";
		}
	}

}
