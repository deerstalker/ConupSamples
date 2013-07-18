package cn.edu.nju.moon.communication.duyu.old;

import java.io.BufferedInputStream;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.util.zip.ZipEntry;
import java.util.zip.ZipInputStream;

import javax.management.MBeanServer;

import org.apache.tuscany.sca.contribution.processor.ContributionReadException;
import org.apache.tuscany.sca.monitor.ValidationException;
import org.apache.tuscany.sca.runtime.ActivationException;
import org.jboss.remoting.InvocationRequest;
import org.jboss.remoting.InvokerLocator;
import org.jboss.remoting.ServerInvocationHandler;
import org.jboss.remoting.ServerInvoker;
import org.jboss.remoting.callback.InvokerCallbackHandler;
import org.jboss.remoting.transport.Connector;

import cn.edu.nju.moon.communication.duyu.old.SetupServer.RecieveCompHandler.UpdateCompHandler;
import cn.edu.nju.moon.communication.launcher.ComponentLaunch;
import cn.edu.nju.moon.communication.update.ComponentUpdater;

public class SetupServer {

	public static void main(String[] args) throws Throwable {
		System.out.println("**********" + "Program is running" + "**********");
		InvokerLocator myLocator = new InvokerLocator(
				"socket://172.25.147.151:8074");
		Connector connector = new Connector(myLocator);
		connector.setInvokerLocator(myLocator.getLocatorURI());
		connector.start();
		RecieveCompHandler myHandler = new RecieveCompHandler();
		connector.addInvocationHandler("composite", myHandler);
		UpdateCompHandler updateHandler = new UpdateCompHandler();
		connector.addInvocationHandler("dilepis.RP", updateHandler);
		System.out.println("**********" + "Server is started" + "**********");
		StartNodeHandler startNodeHandler = new StartNodeHandler();
		connector.addInvocationHandler("start", startNodeHandler);
	}
	private static void startAllNodes() {
		System.out.println("$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$");
		ComponentLaunch dbComponentLaunch = new ComponentLaunch(
				"/home/deerstalker/conup/conup-read-only/samples/hydrology-db/target/classes",
				"hydrology-db", "App.composite", "HydrologyDBComponent");
		ComponentLaunch pondageComponentLaunch = new ComponentLaunch(
				"/home/deerstalker/conup/conup-read-only/samples/hydrology-pondage/target/classes",
				"hydrology-pondage", "App.composite",
				"NodePondageComponent");
		ComponentLaunch cityRainComponentLaunch = new ComponentLaunch(
				"/home/deerstalker/conup/conup-read-only/samples/hydrology-rainfall-city/target/classes",
				"hydrology-rainfall-city", "App.composite",
				"NodeRainfallCityComponent");
		ComponentLaunch stationRainComponentLaunch = new ComponentLaunch(
				"/home/deerstalker/conup/conup-read-only/samples/hydrology-rainfall-station/target/classes",
				"hydrology-rainfall-station", "App.composite",
				"NodeRainfallStationComponent");
		ComponentLaunch wsComponentLaunch = new ComponentLaunch(
				"/home/deerstalker/conup/conup-read-only/samples/hydrology-ws/target/classes",
				"hydrology-ws", "App.composite", "HydrologyComponent");
		ComponentLaunch intergrationComponentLaunch = new ComponentLaunch(
				"/home/deerstalker/conup/conup-read-only/samples/hydrology-intergration/target/classes",
				"hydrology-intergration", "App.composite",
				"HydrologyIntergrationComponent");
		try {
			dbComponentLaunch.startNode();
			pondageComponentLaunch.startNode();
			cityRainComponentLaunch.startNode();
			stationRainComponentLaunch.startNode();
			wsComponentLaunch.startNode();
			intergrationComponentLaunch.startNode();
		} catch (ContributionReadException e) {
			e.printStackTrace();
		} catch (ValidationException e) {
			e.printStackTrace();
		} catch (ActivationException e) {
			e.printStackTrace();
		}

	}

	public static class StartNodeHandler implements ServerInvocationHandler{

		@Override
		public void addListener(InvokerCallbackHandler arg0) {
			// TODO Auto-generated method stub
			
		}

		@Override
		public Object invoke(InvocationRequest arg0) throws Throwable {
			System.out.println("sasdasdwqw");
			startAllNodes();
			return null;
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
	public static class RecieveCompHandler implements ServerInvocationHandler {

		private int num = 0;
		File newfile = null;

		public void addListener(InvokerCallbackHandler arg0) {
			// TODO Auto-generated method stub

		}

		public Object invoke(InvocationRequest request) throws Throwable {
			// TODO Auto-generated method stub
			System.out.println("**********"
					+ "receive a request ,prepare to handle" + "**********");
			String project_path = System.getProperty("user.dir");
			int index = project_path.lastIndexOf('/');
			String workspace = project_path.substring(0, index);

			Object param = request.getParameter();
			final byte[] compositeByteArray = (byte[]) param;
			ByteArrayInputStream tempIStream = new ByteArrayInputStream(
					compositeByteArray);
			BufferedInputStream tempBIStream = new BufferedInputStream(
					tempIStream);
			ZipInputStream zipInput = new ZipInputStream(tempBIStream);
			ZipEntry entry = null;
			OutputStream out = null;
			while ((entry = zipInput.getNextEntry()) != null) {
				File outFile = null;
				String tmp = entry.getName();
				int tindex = tmp.lastIndexOf('.');
				String fn = tmp.substring(0, tindex);
				// tindex = fn.indexOf('-');
				// fn = fn.substring(tindex+1);
				String pathString = "/home/deerstalker/conup/conup-read-only/samples";
				outFile = new File(pathString + File.separator + fn
						+ File.separator + "src" + File.separator + "main"
						+ File.separator + "resources" + File.separator
						+ "app1.composite");
				newfile = outFile;

				if (!outFile.getParentFile().exists()) {
					System.out.println(outFile.getParentFile().mkdir());
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

			System.out.println("**********" + "Return" + "**********");
			
			
			return "Success";
		}

		public void removeListener(InvokerCallbackHandler arg0) {
			// TODO Auto-generated method stub

		}

		public void setInvoker(ServerInvoker arg0) {
			// TODO Auto-generated method stub

		}

		public void setMBeanServer(MBeanServer arg0) {
			// TODO Auto-generated method stub

		}

		
		public static class UpdateCompHandler implements
				ServerInvocationHandler {

			@Override
			public void addListener(InvokerCallbackHandler arg0) {
				// TODO Auto-generated method stub

			}

			@Override
			public Object invoke(InvocationRequest request) throws Throwable {

				Object[] params = (Object[]) request.getParameter();

				if (params[0].equals("deactive")) {
					// process deactive action
					Thread.sleep(2000);
					DeactiveSuccess d = new DeactiveSuccess();
					d.setComp(params[1].toString());
					d.deactiveSuccess();
					System.out.println("handle deactive");
				} else if (params[0].equals("update")) {
					System.out.println("update");
					String comp = params[5].toString();
					String classFilePath = params[1].toString();
					String contributionUri = params[2].toString();
					String compositeUri = params[3].toString();
					String port = params[4].toString();
					// System.out.println(comp+","+classFilePath+","+contributionUri+","+compsiteUri+","+port);
					/*
					 * need to add update
					 */
					String baseDir = "/home/deerstalker/conup/conup-read-only/samples/update";
					ComponentUpdater.updateComponent("172.25.147.151", Integer.parseInt(port), comp, "consistency", baseDir, classFilePath, contributionUri, compositeUri);
					UpdateSuccess u = new UpdateSuccess();
					u.setComp(comp);
					u.updateSuccess();
				}
				return null;
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

	}
}
