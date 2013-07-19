package cn.edu.nju.moon.weather.intergration.services.typhoon;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.QueryParam;
import javax.ws.rs.core.MediaType;

import org.oasisopen.sca.annotation.Remotable;

@Remotable
public interface JaxrsTyphoon {

    @GET
    @Path("getTyphoon")
    @Produces(MediaType.TEXT_PLAIN)
    String getTyphoon(@QueryParam("flag") String flag);
}
