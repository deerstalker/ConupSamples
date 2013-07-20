package cn.edu.nju.moon.station.portal.services;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.QueryParam;
import javax.ws.rs.core.MediaType;

import org.oasisopen.sca.annotation.Remotable;

@Remotable
public interface JaxrsPortal {

    @GET
    @Path("execute")
    @Produces(MediaType.TEXT_PLAIN)
    String execute(@QueryParam("stationId") String stationId);
}
