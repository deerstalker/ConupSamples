package cn.edu.nju.moon.communication.duyu.old;


import org.jboss.remoting.Client;
import org.jboss.remoting.InvokerLocator;

public class RecievedComposite {

	public void recievedCompositeSuccess() throws Throwable{
		InvokerLocator myLocator = new InvokerLocator("socket://172.25.146.39:9001");
		Client myClient = new Client(myLocator,"dilepis.reb");
		myClient.connect();
		Object[] params = new Object[3];
		params[0]="print";
		params[1]="[Server]composite";
		myClient.invoke(params);
	}
	

}
