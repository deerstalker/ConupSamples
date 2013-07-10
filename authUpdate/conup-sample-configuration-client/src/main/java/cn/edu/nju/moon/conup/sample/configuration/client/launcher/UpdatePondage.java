package cn.edu.nju.moon.conup.sample.configuration.client.launcher;

import java.util.logging.Logger;

import cn.edu.nju.moon.conup.remote.services.impl.RemoteConfServiceImpl;

public class UpdatePondage {
	private static final Logger LOGGER = Logger.getLogger(UpdatePondage.class.getName());
	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		update("NodePondageComponent", "/home/deerstalker/conup/conup-read-only/samples/update");
	}
	public static void update(String compIdentifier, String baseDir) {
		String classFilePath = null;
		String contributionUri = null;
		String compsiteUri = null;
		int port = 0;
		RemoteConfServiceImpl rcs =  new RemoteConfServiceImpl();
		if (compIdentifier.equals("AuthComponent")) {
			classFilePath = "cn.edu.nju.moon.conup.sample.auth.services.AuthServiceImpl";
			contributionUri = "conup-sample-auth";
			compsiteUri = "auth.composite";
			port = 18082;
		} else if (compIdentifier.equals("DBComponent")) {
			classFilePath = "cn.edu.nju.moon.conup.sample.db.services.DBServiceImpl";
			contributionUri = "conup-sample-db";
			compsiteUri = "db.composite";
			port = 18081;
		} else if (compIdentifier.equals("ProcComponent")) {
			classFilePath = "cn.edu.nju.moon.conup.sample.proc.services.ProcServiceImpl";
			contributionUri = "conup-sample-proc";
			compsiteUri = "proc.composite";
			port = 18083;
		} else if (compIdentifier.equals("PortalComponent")) {
			classFilePath = "cn.edu.nju.moon.conup.sample.portal.services.PortalServiceImpl";
			contributionUri = "conup-sample-portal";
			compsiteUri = "portal.composite";
			port = 18084;
		} else if(compIdentifier.equals("NodePondageComponent")){ 
			classFilePath = "cn.edu.nju.moon.node.pondage.PondageServiceImpl";
			contributionUri = "hydrology-pondage";
			compsiteUri = "App.composite";
			port = 18082;
		}
		else {
			LOGGER.warning("only support AuthComponent, DBComponent, ProcComponent, PortalComponent update...");
			return;
		}
		
		
		rcs.update("172.25.147.151", port, compIdentifier, "CONSISTENCY", baseDir, classFilePath, contributionUri, compsiteUri);
	}
}
