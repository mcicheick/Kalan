/**
 * 
 */
package models;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Lob;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import play.data.validation.Required;


/**
 * 
 * @author Cheick Mahady Sissoko
 * @date 7 sept. 2014 17:52:07
 */
@SuppressWarnings("serial")
@Entity
@Table(name = "T_FILIERES")
public class Filiere extends Standard {
	
	@Required(message = "required.filiere.code")
	@Column(name = "CODE")
	public String code;
	
	@Required(message = "required.filiere.nom")
	@Column(name = "NOM")
	public String nom;

	@Lob
	@Required(message = "required.filiere.description")
	@Column(name = "DESCRIPTION")
	public String description;
	
	@OneToMany(cascade = CascadeType.DETACH, mappedBy = "filiere")
	public List<Eleve> eleves;

	public Filiere() {
		super();
	}
	
	@Override
	public String toString() {
		// TODO Auto-generated method stub
		return super.toString() + "(" + code + ")";
	}
}
