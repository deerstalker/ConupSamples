package cn.edu.nju.moon.communication.duyu.fresh.server;



import org.jboss.remoting.InvokerLocator;
import org.jboss.remoting.transport.Connector;

public class MsgServer {

	private String HostAddress = null;
	private String RemoteAddress = null;
	private String projectPath = null;
	
	/**
	 * 默认构造函数，监听地址默认为localhost:8074
	 * @param projectPath 为项目的根目录
	 */
	public MsgServer(String projectPath,String RemoteAddress){
		this.HostAddress = "socket://localhost:8074";
		this.RemoteAddress = "socket://"+RemoteAddress+":9001";
		this.projectPath = projectPath;
	}
	/**
	 * 构造函数，传入本机的ip地址，默认的端口是8084（不需要传入）       
	 * @param HostAddress 为本机的ip地址
	 * @param projectPath 为项目的根目录
	 */
	public MsgServer(String HostAddress,String projectPath,String RemoteAddress){
		this.HostAddress = "socket://"+HostAddress+":8074";
		this.RemoteAddress = "socket://"+RemoteAddress+":9001";
		this.projectPath = projectPath;
	}
	/**
	 * 启动监听服务，
	 * 在建立对象后需要立即使用
	 * @author duyu
	 */
	public void startServer() throws Throwable{
		InvokerLocator myLocator = new InvokerLocator(HostAddress);
		Connector connector = new Connector(myLocator);
		connector.setInvokerLocator(myLocator.getLocatorURI());
		connector.start();
		
		MsgPool pool = MsgPool.getInstance();
		pool.putMsgServer(this);
		
		System.out.println("Server Msg:启动监听服务");
		
		RecieveCompHandler myHandler = new RecieveCompHandler();
		connector.addInvocationHandler("artemis.composite", myHandler);
		
		RecieveUpdateHandler updateHandler = new RecieveUpdateHandler();
		connector.addInvocationHandler("artemis.update", updateHandler);
		
		RecieveStartNodeHandler startNodeHandler = new RecieveStartNodeHandler();
		connector.addInvocationHandler("artemis.start", startNodeHandler);

	}
	public String getProjectPath(){
		return projectPath;
	}
	public String getRemoteIP(){
		return RemoteAddress;
	}

}
