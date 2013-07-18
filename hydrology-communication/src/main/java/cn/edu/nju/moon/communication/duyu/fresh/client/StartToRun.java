package cn.edu.nju.moon.communication.duyu.fresh.client;

import org.jboss.remoting.Client;
import org.jboss.remoting.InvokerLocator;

import cn.edu.nju.moon.communication.duyu.fresh.server.MsgPool;
import cn.edu.nju.moon.communication.duyu.fresh.server.MsgServer;


public class StartToRun {
	public void start2run() throws Throwable{
		MsgPool pool = MsgPool.getInstance();
		MsgServer msgs = pool.getMsgServer();
		String remoteIP = msgs.getRemoteIP();
		
		InvokerLocator myLocator = new InvokerLocator(remoteIP);
		Client myClient = new Client(myLocator,"dilepis.reb");
		myClient.connect();
		Object[] params = new Object[3];
		params[0]="run";
		params[1]="[Server]开始运行";
		myClient.invoke(params);
//		System.out.println("shou dao composite wen jian le !");
		
	}
}
