package cn.edu.nju.moon.weather.city.services;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.QueryParam;
import javax.ws.rs.core.MediaType;

import org.oasisopen.sca.annotation.Remotable;

@Remotable
public interface JaxrsCityWeather {

    @GET
    @Path("getCityWeather")
    @Produces(MediaType.TEXT_PLAIN)
    String getCityWeather(@QueryParam("name") String city, @QueryParam("time") String time);
}
