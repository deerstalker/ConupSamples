package cn.edu.nju.moon.node.pondage.launcher;

import java.util.logging.Logger;

import org.apache.tuscany.sca.Node;
import org.oasisopen.sca.NoSuchServiceException;

import cn.edu.nju.moon.node.pondage.PondageService;



public class TestServiceThread extends Thread{
	private Node node;
	private Logger LOGGER = Logger.getLogger(TestServiceThread.class.getName());
	public TestServiceThread(Node node){
		this.node = node;
	}
	
	public void run(){
		try {
			PondageService hydrologyService = node.getService(PondageService.class, "NodePondageComponent/PondageService");
			LOGGER.info("\t" + "" + hydrologyService.getNodePondage("xiaoqiao", "2012-08-09 09:00:00"));
		} catch (NoSuchServiceException e) {
			e.printStackTrace();
		}
	}
}
