package cn.edu.nju.moon.communication.duyu.fresh.server;

import java.io.BufferedInputStream;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.util.zip.ZipEntry;
import java.util.zip.ZipInputStream;

import javax.management.MBeanServer;



import org.jboss.remoting.InvocationRequest;
import org.jboss.remoting.ServerInvocationHandler;
import org.jboss.remoting.ServerInvoker;
import org.jboss.remoting.callback.InvokerCallbackHandler;

import cn.edu.nju.moon.communication.duyu.fresh.client.RecievedComposite;


/**
 * 接收composite文件后的处理函数
 * @author duyu
 *
 */
public class RecieveCompHandler implements ServerInvocationHandler{
	private int num = 0;
	File newfile = null;
	@Override
	public void addListener(InvokerCallbackHandler arg0) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public Object invoke(InvocationRequest request) throws Throwable {
		
		MsgPool pool = MsgPool.getInstance();
		MsgServer msgs = pool.getMsgServer();
		String project_path = msgs.getProjectPath();
		
		Object param = request.getParameter();
		final byte[] compositeByteArray = (byte[])param;
		ByteArrayInputStream tempIStream = new ByteArrayInputStream(
				compositeByteArray);
		BufferedInputStream tempBIStream = new BufferedInputStream(
				tempIStream);
		ZipInputStream zipInput = new ZipInputStream(
				tempBIStream);
		// 定义压缩输入流
		ZipEntry entry = null;
		OutputStream out = null;
		// 将压缩包临时解压--放入制定的文件夹内
		while ((entry = zipInput.getNextEntry()) != null) {
			File outFile = null;
			String tmp = entry.getName();
			int tindex = tmp.lastIndexOf('.');
			String fn = tmp.substring(0,tindex);
			outFile = new File(project_path+File.separator+fn
					+ File.separator+"src"+
					File.separator+"main"+
					File.separator+"resources"+
					File.separator+ "APP17_10_17.composite");
			newfile = outFile;
			
			if (!outFile.getParentFile().exists()) {
				System.out.println(outFile.getParentFile()
						.mkdir());
			}
			out = new FileOutputStream(outFile);
			int tempbyte = 0;
			while ((tempbyte = zipInput.read()) != -1) {
				out.write(tempbyte);
			}
			out.close();

		}
		
		RecievedComposite s = new RecievedComposite();
		s.recievedCompositeSuccess();

		return "Success";
	}

	@Override
	public void removeListener(InvokerCallbackHandler arg0) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void setInvoker(ServerInvoker arg0) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void setMBeanServer(MBeanServer arg0) {
		// TODO Auto-generated method stub
		
	}

}
