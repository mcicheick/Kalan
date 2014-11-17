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

import play.data.validation.Required;

/**
 * @author Cheick Mahady Sissoko
 * @date 7 sept. 2014 19:02:01
 */
@SuppressWarnings("serial")
@Entity
@Table(name = "T_ELEVES")
public class Eleve extends Person {
	
	@Required(message = "required.eleve.filiere")
	@ManyToOne
	public Filiere filiere;
	
	@Required(message = "required.eleve.group")
	@ManyToOne
	public Group group;
	
	@ManyToOne
	public EmploiDuTemps emploiDuTemps;
	
	@ManyToOne(cascade = CascadeType.PERSIST)
	public Professeur tuteur;
	
	@OneToMany(cascade = CascadeType.ALL, mappedBy = "eleve")
	public List<EleveMatiere> matieres;
	
	@OneToMany(cascade = CascadeType.ALL, mappedBy = "eleve")
	public List<Note> notes;
	
	@OneToMany(cascade = CascadeType.ALL, mappedBy = "eleve")
	public List<Attachment> attachments;
	
	public Eleve() {
		super();
	}
}
