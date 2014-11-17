/**
 * 
 */
package models;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

/**
 * @author Cheick Mahady Sissoko
 * @date 29 août 2014 13:32:35
 */
@Entity
@Table(name = "T_SUBMENUS")
public class Submenu extends Standard {

	@Column(name = "ORDRE")
	public int ordre;
	@Column(name = "TITLE")
	public String title;
	
	public Submenu() {
		super();
	}

	/**
	 * 
	 * @param submenuType
	 * @return
	 */
	public static List<Submenu> values(int submenuType) {
		return Submenu.find("submenuType = ? and order by ordre asc",
				submenuType).fetch();
	}

	/**
	 * 
	 * @param submenuType
	 * @return
	 */
	public static List<Submenu> values() {
		return Submenu.find("order by ordre asc").fetch();
	}

	@Override
	public String toString() {
		return super.toString() + title + " (" + ordre + ")";
	}

}
