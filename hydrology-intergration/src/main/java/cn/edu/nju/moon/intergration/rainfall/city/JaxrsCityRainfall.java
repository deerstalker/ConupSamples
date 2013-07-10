package cn.edu.nju.moon.intergration.rainfall.city;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.QueryParam;
import javax.ws.rs.core.MediaType;

import org.oasisopen.sca.annotation.Remotable;

@Remotable
public interface JaxrsCityRainfall {

    @GET
    @Path("getCityRf")
    @Produces(MediaType.TEXT_PLAIN)
    String getCityRf(@QueryParam("name") String city, @QueryParam("time") String time);
}