/**
 * 
 */
package models;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import play.data.validation.Required;


/**
 * @author Cheick Mahady Sissoko
 * @date 7 sept. 2014 19:35:44
 */
@SuppressWarnings("serial")
@Entity
@Table(name = "T_ADMINISTRATEURS")
public class Administrateur extends Person {
	
	@Required(message = "required.administrateur.poste")
	@Column(name = "POSTE")
	public String poste;
	
	@OneToOne(cascade = CascadeType.ALL)
	public User user;
	
	@OneToMany(cascade = CascadeType.ALL, mappedBy = "administrateur")
	public List<Attachment> attachments;
	
	public Administrateur() {
		super();
	}
	
}
