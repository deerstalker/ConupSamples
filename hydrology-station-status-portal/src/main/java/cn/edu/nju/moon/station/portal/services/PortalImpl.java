package cn.edu.nju.moon.station.portal.services;

import java.io.UnsupportedEncodingException;

import org.oasisopen.sca.annotation.Reference;
import org.oasisopen.sca.annotation.Service;

import cn.edu.nju.moon.conup.spi.datamodel.ConupTransaction;

@Service(Portal.class)
public class PortalImpl implements Portal{

	private Auth auth;
	private Proc proc;
	@ConupTransaction
	public String execute(String stationId) {
		// TODO Auto-generated method stub
		String token = auth.getToken();
		String result = proc.process(stationId, token);
		try {
			result = new String(result.getBytes("ISO-8859-1"),"UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}
	public Auth getAuth() {
		return auth;
	}
	@Reference
	public void setAuth(Auth auth) {
		this.auth = auth;
	}
	public Proc getProc() {
		return proc;
	}
	@Reference
	public void setProc(Proc proc) {
		this.proc = proc;
	}

}
