/**
 * 
 */
package controllers;

/**
 * @author Cheick Mahady Sissoko
 * @date 7 sept. 2014 22:52:59
 */
public class Security extends Secure.Security {

	
	/**
	 * 
	 * @param username
	 * @param password
	 * @return
	 */
	static boolean authentify(String username, String password) {
		System.out.println("Security.authentify()");
        return true;
    }
	/**
	 * 
	 * @param username
	 * @param password
	 * @return
	 */
	static boolean authenticate(String username, String password) {
		System.out.println("Security.authenticate()");
        return true;
    }

    /**
     * This method checks that a profile is allowed to view this page/method. This method is called prior
     * to the method's controller annotated with the @Check method. 
     *
     * @param profile
     * @return true if you are allowed to execute this controller method.
     */
    static boolean check(String profile) {
    	System.out.println("Security.check()");
		if ("admin".equals(profile)) {
			return true;
		} else
			return false;
	}

	static void onDisconnected() {
		session.clear();
	}
    
    static void onAuthenticated() {
        Admin.index();
    }
}
