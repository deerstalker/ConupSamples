package cn.edu.nju.moon.communication.update;

import cn.edu.nju.moon.conup.remote.services.impl.RemoteConfServiceImpl;

public class ComponentUpdater {
	/*
	 * rcs.update("172.25.147.151", port, compIdentifier, "CONSISTENCY",
	 * baseDir, classFilePath, contributionUri, compsiteUri);
	 */

	public static void updateComponent(String ip, int port,
			String compIdentifier, String policy, String baseDir,
			String classFilePath, String contributionUri, String compositeUri) {
		
		RemoteConfServiceImpl rcs = new RemoteConfServiceImpl();
//		classFilePath = "cn.edu.nju.moon.node.pondage.PondageServiceImpl";
//		contributionUri = "hydrology-pondage";
//		compositeUri = "App.composite";
		rcs.update(ip, port, compIdentifier, "CONSISTENCY",
				baseDir, classFilePath, contributionUri, compositeUri);
	}
}
