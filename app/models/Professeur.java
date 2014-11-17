/**
 * 
 */
package models;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 * @author Cheick Mahady Sissoko
 * @date 7 sept. 2014 19:02:01
 */
@SuppressWarnings("serial")
@Entity
@Table(name = "T_PROFESSEURS")
public class Professeur extends Person {

	@ManyToOne(cascade = CascadeType.PERSIST)
	public EmploiDuTemps emploiDuTemps;
	
	@OneToMany(cascade = CascadeType.ALL, mappedBy = "tuteur")
	public List<Eleve> eleves;
	
	@OneToMany(cascade = CascadeType.ALL, mappedBy = "professeur")
	public List<ProfesseurMatiere> matieres;
	
	@OneToMany(cascade = CascadeType.ALL, mappedBy = "professeur")
	public List<Attachment> attachments;
	
	public Professeur() {
		super();
	}
}
