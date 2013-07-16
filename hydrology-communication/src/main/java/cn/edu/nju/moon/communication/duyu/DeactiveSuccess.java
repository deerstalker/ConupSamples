package cn.edu.nju.moon.communication.duyu;


import org.jboss.remoting.Client;
import org.jboss.remoting.InvokerLocator;

public class DeactiveSuccess {

	private String comp;
	public void deactiveSuccess() throws Throwable{
		InvokerLocator myLocator = new InvokerLocator("socket://172.25.146.39:9001");
		Client myClient = new Client(myLocator,"dilepis.reb");
		myClient.connect();
		Object[] params = new Object[3];
		params[0]="second";
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
