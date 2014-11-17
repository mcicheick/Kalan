package models;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.IdClass;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import play.db.jpa.GenericModel;


/**
 * 
 * @author Cheick Mahady Sissoko
 * @date 13 avr. 2014 16:50:36
 */
@SuppressWarnings("serial")
@Entity
@Table(name = "AS_USERS_RIGHTS")
@IdClass(UserRightId.class)
public class UserRight extends GenericModel {

	@Id
	@Column(name = "USER_ID")
	public long user_id;
	@Id
	@Column(name = "RIGHT_ID")
	public long right_id;
	
	@ManyToOne(cascade={CascadeType.ALL})
	@JoinColumn(name = "USER_ID", updatable = false, insertable = false, referencedColumnName = "id")
	public User user;
	
	@ManyToOne(cascade={CascadeType.ALL})
	@JoinColumn(name = "RIGHT_ID", updatable = false, insertable = false, referencedColumnName = "id")
	public Right right;
	
	/**
	 * Default constructor. Only used by JPA.
	 */
	public UserRight() {
		super();
	}
	
	/**
	 * @param user_id
	 * @param right_value
	 */
	public UserRight(long user_id, long right_id) {
		this.user_id = user_id;
		this.right_id = right_id;
	}



	@Override
	public String toString() {
		StringBuilder result = new StringBuilder();
		result.append("UserRight-");
		result.append("("+user_id+", "+right_id+")");
		return result.toString();
	}
}
