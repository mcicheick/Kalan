/**
 * 
 */
package models;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.OneToMany;
import javax.persistence.Table;


/**
 * @author Cheick Mahady Sissoko
 * @date 7 sept. 2014 19:30:12
 */
@SuppressWarnings("serial")
@Entity
@Table(name = "T_USERS")
public class User extends Person {

	/**
	 * 
	 */
	@Column(name = "ROLE")
	@Enumerated(EnumType.STRING)
	public RoleEnum role;
	@OneToMany(cascade = { CascadeType.ALL }, mappedBy = "user")
	public List<UserRight> rights;
	
	public User() {
		super();
	}
}
