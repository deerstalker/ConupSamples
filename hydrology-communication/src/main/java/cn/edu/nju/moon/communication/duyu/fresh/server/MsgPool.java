package cn.edu.nju.moon.communication.duyu.fresh.server;

public class MsgPool {
	private static MsgPool instance = new MsgPool();
	private MsgServer msgs;
	public static MsgPool getInstance(){
		return instance;
	}
	public void putMsgServer(MsgServer msgs){
		this.msgs = msgs;
	}
	public MsgServer getMsgServer(){
		return msgs;
	}
}
