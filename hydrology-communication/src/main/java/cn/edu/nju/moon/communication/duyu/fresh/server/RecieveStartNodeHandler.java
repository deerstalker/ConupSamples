package cn.edu.nju.moon.communication.duyu.fresh.server;

import javax.management.MBeanServer;

import org.apache.tuscany.sca.contribution.processor.ContributionReadException;
import org.apache.tuscany.sca.monitor.ValidationException;
import org.apache.tuscany.sca.runtime.ActivationException;
import org.jboss.remoting.InvocationRequest;
import org.jboss.remoting.ServerInvocationHandler;
import org.jboss.remoting.ServerInvoker;
import org.jboss.remoting.callback.InvokerCallbackHandler;

import cn.edu.nju.moon.communication.duyu.fresh.client.StartToRun;
import cn.edu.nju.moon.communication.launcher.ComponentLaunch;


public class RecieveStartNodeHandler implements ServerInvocationHandler{

	@Override
	public void addListener(InvokerCallbackHandler arg0) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public Object invoke(InvocationRequest arg0) throws Throwable {
		StartToRun s = new StartToRun();
		s.start2run();
		
		//在这里写run的代码
		startAllNodes();
		//
		
		return null;
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
		ComponentLaunch weatherCityComponentLaunch = new ComponentLaunch(
				"/home/deerstalker/conup/conup-read-only/samples/hydrology-weather-db-city/target/classes",
				"hydrology-weather-db-city", "App.composite",
				"DBCityWeatherComponent");
		ComponentLaunch weatherStationComponentLaunch = new ComponentLaunch(
				"/home/deerstalker/conup/conup-read-only/samples/hydrology-weather-db-station/target/classes",
				"hydrology-weather-db-station", "App.composite",
				"DBStationWeatherComponent");
		ComponentLaunch weatherIntergrationComponentLaunch = new ComponentLaunch(
				"/home/deerstalker/conup/conup-read-only/samples/hydrology-weather-intergration/target/classes",
				"hydrology-weather-intergration", "App.composite",
				"WeatherIntergrationComponent");
		ComponentLaunch typhoonDbComponentLaunch = new ComponentLaunch(
				"/home/deerstalker/conup/conup-read-only/samples/hydrology-typhoon-db/target/classes",
				"hydrology-typhoon-db", "App.composite", "TyphoonDbComponent");
		ComponentLaunch stationAuthComponentLaunch = new ComponentLaunch(
				"/home/deerstalker/conup/conup-read-only/samples/hydrology-station-status-auth/target/classes",
				"hydrology-station-status-auth", "App.composite", "HydrologyStationAuthComponent");
		ComponentLaunch stationProcComponentLaunch = new ComponentLaunch(
				"/home/deerstalker/conup/conup-read-only/samples/hydrology-station-status-proc/target/classes",
				"hydrology-station-status-proc", "App.composite", "HydrologyStationProcComponent");
		ComponentLaunch stationPortalComponentLaunch = new ComponentLaunch(
				"/home/deerstalker/conup/conup-read-only/samples/hydrology-station-status-portal/target/classes",
				"hydrology-station-status-portal", "App.composite", "HydrologyStationPortalComponent");
		ComponentLaunch stationDBComponentLaunch = new ComponentLaunch(
				"/home/deerstalker/conup/conup-read-only/samples/hydrology-station-status-db/target/classes",
				"hydrology-station-status-db", "App.composite", "HydrologyStationDBComponent");
		try {
			dbComponentLaunch.startNode();
			pondageComponentLaunch.startNode();
			cityRainComponentLaunch.startNode();
			stationRainComponentLaunch.startNode();
			wsComponentLaunch.startNode();
			intergrationComponentLaunch.startNode();
			weatherCityComponentLaunch.startNode();
			weatherStationComponentLaunch.startNode();
			weatherIntergrationComponentLaunch.startNode();
			typhoonDbComponentLaunch.startNode();
			stationAuthComponentLaunch.startNode();
			stationProcComponentLaunch.startNode();
			stationPortalComponentLaunch.startNode();
			stationDBComponentLaunch.startNode();
			
		} catch (ContributionReadException e) {
			e.printStackTrace();
		} catch (ValidationException e) {
			e.printStackTrace();
		} catch (ActivationException e) {
			e.printStackTrace();
		}

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
