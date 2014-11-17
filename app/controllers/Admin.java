/**
 * 
 */
package controllers;


import play.mvc.Controller;
import play.mvc.With;

/**
 * @author Cheick Mahady Sissoko
 * @date 7 sept. 2014 22:51:26
 */
@With(Secure.class)
public class Admin extends Controller {
	
	public static void index() {
        render();
    }

}
