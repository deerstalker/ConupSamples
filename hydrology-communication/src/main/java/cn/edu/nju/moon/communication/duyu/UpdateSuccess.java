package cn.edu.nju.moon.communication.duyu;


import org.jboss.remoting.Client;
import org.jboss.remoting.InvokerLocator;

public class UpdateSuccess {

	private String comp;
	public void updateSuccess() throws Throwable{
		InvokerLocator myLocator = new InvokerLocator("socket://192.168.0.1557:9001");
		Client myClient = new Client(myLocator,"dilepis.reb");
		myClient.connect();
		Object[] params = new Object[3];
		params[0]="third";
		params[1]=getComp();
		myClient.invoke(params);
	}
	public String getComp() {
		return comp;
	}
	public void setComp(String comp) {
		this.comp = comp;
	}
	

}
