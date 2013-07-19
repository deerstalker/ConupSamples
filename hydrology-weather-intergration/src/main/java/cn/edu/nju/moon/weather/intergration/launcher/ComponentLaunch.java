package cn.edu.nju.moon.weather.intergration.launcher;

import org.apache.tuscany.sca.Node;
import org.apache.tuscany.sca.TuscanyRuntime;
import org.apache.tuscany.sca.contribution.processor.ContributionReadException;
import org.apache.tuscany.sca.monitor.ValidationException;
import org.apache.tuscany.sca.runtime.ActivationException;

import cn.edu.nju.conup.comm.api.manager.CommServerManager;
import cn.edu.nju.moon.conup.ext.lifecycle.CompLifecycleManager;
import cn.edu.nju.moon.conup.spi.manager.NodeManager;

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

	}
	public void stopNode(){
		node.stop();
	}
	

}
