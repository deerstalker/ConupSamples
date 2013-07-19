package cn.edu.nju.moon.weather.station.services;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.QueryParam;
import javax.ws.rs.core.MediaType;

import org.oasisopen.sca.annotation.Remotable;

@Remotable
public interface JaxrsStationWeather {

    @GET
    @Path("getStationWeather")
    @Produces(MediaType.TEXT_PLAIN)
    String getStationWeather(@QueryParam("name") String station, @QueryParam("time") String time);
}
