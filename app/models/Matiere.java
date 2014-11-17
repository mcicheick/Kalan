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
 * @date 7 sept. 2014 17:51:52
 */
@SuppressWarnings("serial")
@Entity
@Table(name = "T_MATIERES")
public class Matiere extends Standard {
	
	@Required(message = "required.matiere.code")
	@Column(name = "CODE")
	public String code;
	
	@Lob
	@Required(message = "required.matiere.intitule")
	@Column(name = "INTITULE")
	public String intitule;
	
	@OneToMany(cascade = CascadeType.ALL, mappedBy = "matiere")
	public List<CreneauHoraire> creneauHoraires;
	
	@OneToMany(cascade = CascadeType.ALL, mappedBy = "matiere")
	public List<EleveMatiere> eleves;
	
	@OneToMany(cascade = CascadeType.ALL, mappedBy = "matiere")
	public List<ProfesseurMatiere> professeurs;

	public Matiere() {
		super();
	}
	
	@Override
	public String toString() {
		// TODO Auto-generated method stub
		return super.toString() + "(" + code + ")";
	}
}
