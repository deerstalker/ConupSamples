package cn.edu.nju.moon.communication.update;

import java.util.logging.Logger;

import cn.edu.nju.moon.conup.remote.services.impl.RemoteConfServiceImpl;

public class UpdatePondage {
	private static final Logger LOGGER = Logger.getLogger(UpdatePondage.class
			.getName());

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		update("NodePondageComponent",
				"/home/deerstalker/conup/conup-read-only/samples/update");
	}

	public static void update(String compIdentifier, String baseDir) {
		String classFilePath = null;
		String contributionUri = null;
		String compsiteUri = null;
		RemoteConfServiceImpl rcs = new RemoteConfServiceImpl();

		classFilePath = "cn.edu.nju.moon.node.pondage.PondageServiceImpl";
		contributionUri = "hydrology-pondage";
		compsiteUri = "App.composite";
		int port = 18082;
		/*
		 * 172.25.147.151$18082$NodePondageComponent$CONSISTENCY$/home/deerstalker
		 * /
		 * conup/conup-read-only/samples/hydrology-pondage/target/classes/$cn/edu
		 * /nju/moon/node/pondage/PondageServiceImpl$hydrology-pondage$App.
		 * composite$172.25.146.39
		 */
		rcs.update("172.25.147.151", 18082, "NodePondageComponent",
				"CONSISTENCY",
				"/home/deerstalker/conup/conup-read-only/samples/update/",
				"cn.edu.nju.moon.node.pondage.PondageServiceImpl",
				"hydrology-pondage", "App.composite", "172.25.146.39");
	}
}
