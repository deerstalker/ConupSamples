package cn.edu.nju.moon.ws.rainfall.station;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.QueryParam;
import javax.ws.rs.core.MediaType;

import org.oasisopen.sca.annotation.Remotable;

@Remotable
public interface JaxrsStationRainfall {

    @GET
    @Path("getWSStationRf")
    @Produces(MediaType.TEXT_PLAIN)
    String getWSStationRf(@QueryParam("name") String station, @QueryParam("time") String time);
}
