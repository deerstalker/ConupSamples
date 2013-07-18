package cn.edu.nju.moon.communication.duyu.fresh.server;

import javax.management.MBeanServer;



import org.jboss.remoting.InvocationRequest;
import org.jboss.remoting.ServerInvocationHandler;
import org.jboss.remoting.ServerInvoker;
import org.jboss.remoting.callback.InvokerCallbackHandler;

import cn.edu.nju.moon.communication.duyu.fresh.client.RecievedAlgorithm;
import cn.edu.nju.moon.communication.duyu.fresh.client.RecievedUpdate;


public class RecieveUpdateHandler implements ServerInvocationHandler{

	@Override
	public void addListener(InvokerCallbackHandler arg0) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public Object invoke(InvocationRequest request) throws Throwable {
		System.out.println("by chendong: invoke in ReceiveUpdateHandler~");
		Object[] params = (Object [])request.getParameter();
		
		if(params[0].equals("algorithm")){
			RecievedAlgorithm r = new RecievedAlgorithm();
			r.recievedAlgorithmSuccess(params[1].toString());
			
			
			
		}else if(params[0].equals("update")){
			String comp = params[5].toString();
			String classFilePath = params[1].toString();
			String contributionUri = params[2].toString();
			String compsiteUri =  params[3].toString();
			String port = params[4].toString();
			//在这里写更新的代码
			
			//
			RecievedUpdate u = new RecievedUpdate();
			u.recievedUpdateMsg();
		}
		return null;
	}

	@Override
	public void removeListener(InvokerCallbackHandler arg0) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void setInvoker(ServerInvoker arg0) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void setMBeanServer(MBeanServer arg0) {
		// TODO Auto-generated method stub
		
	}

}
