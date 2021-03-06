package cn.edu.nju.moon.typhoon.launcher;

import java.io.UnsupportedEncodingException;

import org.apache.tuscany.sca.Node;
import org.apache.tuscany.sca.TuscanyRuntime;
import org.apache.tuscany.sca.contribution.processor.ContributionReadException;
import org.apache.tuscany.sca.monitor.ValidationException;
import org.apache.tuscany.sca.runtime.ActivationException;
import org.oasisopen.sca.NoSuchServiceException;

import cn.edu.nju.conup.comm.api.manager.CommServerManager;
import cn.edu.nju.moon.conup.ext.lifecycle.CompLifecycleManager;
import cn.edu.nju.moon.conup.spi.manager.NodeManager;
import cn.edu.nju.moon.typhoon.services.Typhoon;

public class ComponentLaunch {

	/**
	 * @param args
	 */
	private String contributionURL;
	private String contributionName;
	private String compositeName;
	private String componentName;
	private Node node;
	public ComponentLaunch(String contributionURL, String contributionName, String compositeName, String componentName){
		this.contributionURL = contributionURL;
		this.contributionName = contributionName;
		this.compositeName = compositeName;
		this.componentName = componentName;
		
	}
	
	public void startNode() throws ContributionReadException, ValidationException, ActivationException{
		// domain uri
		String domainUri = "uri:default";
		TuscanyRuntime runtime = TuscanyRuntime.newInstance();
		// create Tuscany node
		node = runtime.createNode(domainUri);
		node.installContribution(contributionURL);
		node.startComposite(contributionName, compositeName);

		// initiate NodeManager
		NodeManager nodeMgr;
		nodeMgr = NodeManager.getInstance();
		nodeMgr.loadConupConf(componentName, "oldVersion");

		CompLifecycleManager.getInstance(componentName).setNode(node);
		CommServerManager.getInstance().start(componentName);
		try {
			Typhoon typhoon = node.getService(Typhoon.class, "TyphoonDbComponent");
			String result = typhoon.getTyPhoonInfo("1");
			try {
//				String resultUTF8 =  new String(result.getBytes("ISO-8859-1"),"UTF-8");
				String resultUTF8 = new String(result.getBytes("ISO-8859-1"),"UTF-8");
				System.out.println(resultUTF8);
			} catch (UnsupportedEncodingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} 
			
		} catch (NoSuchServiceException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	public void stopNode(){
		node.stop();
	}
	

}
