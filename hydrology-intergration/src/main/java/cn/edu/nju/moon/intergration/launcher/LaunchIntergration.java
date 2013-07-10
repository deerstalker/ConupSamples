package cn.edu.nju.moon.intergration.launcher;

import java.util.logging.Logger;

import org.apache.tuscany.sca.Node;
import org.apache.tuscany.sca.TuscanyRuntime;
import org.apache.tuscany.sca.node.ContributionLocationHelper;

import cn.edu.nju.conup.comm.api.manager.CommServerManager;
import cn.edu.nju.moon.conup.ext.lifecycle.CompLifecycleManager;
import cn.edu.nju.moon.conup.spi.manager.NodeManager;

public class LaunchIntergration {
	private static Logger LOGGER = Logger.getLogger(LaunchIntergration.class.getName());

	/**
	 * distributed.
	 * 
	 * @param args
	 * @throws Exception
	 */
	public static void main(String[] args) throws Exception {
//		LOGGER.fine("Starting hydrology-pondage node ....");
		String contributionURL = ContributionLocationHelper
				.getContributionLocation(LaunchIntergration.class);

		// domain uri
		String domainUri = "uri:default";
		TuscanyRuntime runtime = TuscanyRuntime.newInstance();
		// create Tuscany node
		Node node = runtime.createNode(domainUri);
		node.installContribution(contributionURL);
		node.startComposite("hydrology-intergration", "App.composite");
		System.out.println("~~");
		// add current business node to container

		LOGGER.fine("App.composite ready for big business !!!");

		// initiate NodeManager
		NodeManager nodeMgr;
		nodeMgr = NodeManager.getInstance();
		nodeMgr.loadConupConf("HydrologyIntergrationComponent", "oldVersion");
		// ComponentObject compObj = nodeMgr.getComponentObject("DBComponent");
		// LOGGER.fine(compObj.getStaticDeps() + "\n" +
		// compObj.getStaticInDeps() + "\n" + compObj.getAlgorithmConf());

		CompLifecycleManager.getInstance("HydrologyIntergrationComponent").setNode(node);

		// nodeMgr.getDynamicDepManager("DBComponent").ondemandSetupIsDone();
		CommServerManager.getInstance().start("HydrologyIntergrationComponent");

		// send ondemand request
		// sendOndemandRqst();

		// access
		// accessServices(node);
//		TestServiceThread tServiceThread = new TestServiceThread(node);
//		tServiceThread.start();
		System.in.read();
		LOGGER.fine("Stopping ...");
		node.stop();

	}
}
