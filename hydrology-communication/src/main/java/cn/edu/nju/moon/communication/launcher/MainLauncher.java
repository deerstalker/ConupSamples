package cn.edu.nju.moon.communication.launcher;

import cn.edu.nju.moon.communication.duyu.fresh.server.MsgServer;

public class MainLauncher {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		MsgServer msgServer = new MsgServer("172.25.147.151",
				"/home/deerstalker/conup/conup-read-only/samples",
				"172.25.146.39");
		try {
			msgServer.startServer();
		} catch (Throwable e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
