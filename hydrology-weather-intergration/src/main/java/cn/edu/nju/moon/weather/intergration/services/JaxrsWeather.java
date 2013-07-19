package cn.edu.nju.moon.weather.intergration.services;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.QueryParam;
import javax.ws.rs.core.MediaType;

import org.oasisopen.sca.annotation.Remotable;

@Remotable
public interface JaxrsWeather {

    @GET
    @Path("getWeather")
    @Produces(MediaType.TEXT_PLAIN)
    String getWeather(@QueryParam("name") String name, @QueryParam("time") String time);
}
