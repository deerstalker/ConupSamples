package cn.edu.nju.moon.launcher;

import java.util.logging.Logger;

import org.apache.tuscany.sca.Node;
import org.apache.tuscany.sca.TuscanyRuntime;
import org.apache.tuscany.sca.contribution.processor.ContributionReadException;
import org.apache.tuscany.sca.monitor.ValidationException;
import org.apache.tuscany.sca.node.ContributionLocationHelper;
import org.apache.tuscany.sca.runtime.ActivationException;

import cn.edu.nju.conup.comm.api.manager.CommServerManager;
import cn.edu.nju.moon.launcher.ComponentLaunch;
import cn.edu.nju.moon.conup.ext.lifecycle.CompLifecycleManager;
import cn.edu.nju.moon.conup.spi.manager.NodeManager;

public class LaunchDB {
	private static Logger LOGGER = Logger.getLogger(LaunchDB.class.getName());

	/**
	 * distributed.
	 * 
	 * @param args
	 * @throws Exception
	 */
//	public static void main(String[] args) throws Exception {
//		LOGGER.fine("Starting hydrology-db node ....");
////		String contributionURL = ContributionLocationHelper
////				.getContributionLocation(LaunchDB.class);
//		String contributionURL = "/home/deerstalker/conup/conup-read-only/samples/hydrology-db/target/classes";
//		LOGGER.info(contributionURL);
//		// domain uri
////		String domainUri = "uri:default";
//		String domainUri = null;
//		TuscanyRuntime runtime = TuscanyRuntime.newInstance();
//		// create Tuscany node
//		Node node = runtime.createNode(domainUri);
//		LOGGER.info(node.installContribution(contributionURL));
//		node.startComposite("hydrology-db", "App.composite");
//
//		// add current business node to container
//
//		LOGGER.fine("App.composite ready for big business !!!");
//
//		// initiate NodeManager
//		NodeManager nodeMgr;
//		nodeMgr = NodeManager.getInstance();
//		nodeMgr.loadConupConf("HydrologyDBComponent", "oldVersion");
//		// ComponentObject compObj = nodeMgr.getComponentObject("DBComponent");
//		// LOGGER.fine(compObj.getStaticDeps() + "\n" 	+
//		// compObj.getStaticInDeps() + "\n" + compObj.getAlgorithmConf());
//
//		CompLifecycleManager.getInstance("HydrologyDBComponent").setNode(node);
//
//		// nodeMgr.getDynamicDepManager("DBComponent").ondemandSetupIsDone();
//		CommServerManager.getInstance().start("HydrologyDBComponent");
//
//		// send ondemand request
//		// sendOndemandRqst();
//
//		// access
////		accessServices(node);
////		TestServiceThread tServiceThread = new TestServiceThread(node);
////		tServiceThread.start();
//		System.in.read();
//		LOGGER.fine("Stopping ...");
//		node.stop();
//
//	}
	public static void main(String[] args){
		ComponentLaunch dbComponentLaunch = new ComponentLaunch(
				"/home/deerstalker/conup/conup-read-only/samples/hydrology-db/target/classes",
				"hydrology-db", "App.composite", "HydrologyDBComponent");
		try {
			dbComponentLaunch.startNode();
		} catch (ContributionReadException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ValidationException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ActivationException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
