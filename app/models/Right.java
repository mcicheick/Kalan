package models;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.Table;

/**
 * 
 * @author Cheick Mahady Sissoko
 * @date 13 avr. 2014 16:37:13
 */
@SuppressWarnings("serial")
@Entity
@Table(name = "T_RIGHTS")
public class Right extends Standard {
	
	@Enumerated(EnumType.STRING)
	@Column(name="VALUE", unique=true)
	public RightEnum value;
	
	/**
	 * Default constructor. Only used by JPA.
	 */
	public Right() {
		super();
	}
	
	/**
	 * Constructor using all read-only and all non-nullable properties.
	 */
	public Right(RightEnum value) {
		this();
		this.value = value;
	}
}
