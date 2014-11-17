/**
 * 
 */
package models;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import play.data.validation.Required;


/**
 * 
 * @author Cheick Mahady Sissoko
 * @date 7 sept. 2014 17:52:02
 */
@SuppressWarnings("serial")
@Entity
@Table(name = "T_GROUPS")
public class Group extends Standard {
	
	@Required(message = "required.group.code")
	@Column(name = "CODE")
	public String code;
	
	@Required(message = "required.group.numero")
	@Column(name = "NUMERO")
	public Integer numero;

	@Required(message = "required.group.capacite")
	@Column(name = "CAPACITE")
	public Integer capacite;
	
	@OneToMany(cascade = CascadeType.DETACH, mappedBy = "group")
	public List<Eleve> eleves;

	public Group() {
		super();
	}
	
	@Override
	public String toString() {
		// TODO Auto-generated method stub
		return super.toString() + "(" + code + ")";
	}
}
