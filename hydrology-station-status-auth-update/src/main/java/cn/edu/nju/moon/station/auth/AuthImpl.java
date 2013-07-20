package cn.edu.nju.moon.station.auth;

import org.oasisopen.sca.annotation.Service;

import cn.edu.nju.moon.conup.spi.datamodel.ConupTransaction;

@Service(Auth.class)
public class AuthImpl implements Auth{

	@ConupTransaction
	public String getToken() {
		// TODO Auto-generated method stub
		return "level2";
	}
}
