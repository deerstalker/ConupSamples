package cn.edu.nju.moon.communication.duyu.fresh.server;

import java.util.logging.Logger;

import javax.management.MBeanServer;

import org.jboss.remoting.InvocationRequest;
import org.jboss.remoting.ServerInvocationHandler;
import org.jboss.remoting.ServerInvoker;
import org.jboss.remoting.callback.InvokerCallbackHandler;

import cn.edu.nju.moon.communication.duyu.fresh.client.RecievedAlgorithm;
import cn.edu.nju.moon.communication.duyu.fresh.client.RecievedUpdate;
import cn.edu.nju.moon.communication.update.ComponentUpdater;

public class RecieveUpdateHandler implements ServerInvocationHandler {

	private static Logger logger = Logger.getLogger(RecieveUpdateHandler.class.getName());
	private static String policy;

	@Override
	public void addListener(InvokerCallbackHandler arg0) {
		// TODO Auto-generated method stub

	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * org.jboss.remoting.ServerInvocationHandler#invoke(org.jboss.remoting.
	 * InvocationRequest) params[0] = "update"; params[1] = ip; params[2] = "1"
	 * + port; params[3] = comp; params[4] = basedir; params[5] = classFilePath;
	 * params[6] = contributionUri; params[7] = compsiteUri;
	 */

	@Override
	public Object invoke(InvocationRequest request) throws Throwable {
		Object[] params = (Object[]) request.getParameter();

		if (params[0].equals("algorithm")) {
			RecievedAlgorithm r = new RecievedAlgorithm();
			r.recievedAlgorithmSuccess(params[1].toString());
			policy = params[1].toString();

		} else if (params[0].equals("update")) {
			// 在这里写更新的代码
			ComponentUpdater.updateComponent(params[1].toString(),
					Integer.parseInt(params[2].toString()),
					params[3].toString(), policy, params[4].toString(),
					params[5].toString(), params[6].toString(),
					params[7].toString(), "172.25.147.132");
			
			/*
			 * add by chendong:test
			 */
			logger.info(params[1].toString()+"$"+
					Integer.parseInt(params[2].toString())+"$"+
					params[3].toString()+"$"+policy+"$"+params[4].toString()+"$"+
					params[5].toString()+"$"+params[6].toString()+"$"+
					params[7].toString()+"$"+"172.25.146.39");
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
