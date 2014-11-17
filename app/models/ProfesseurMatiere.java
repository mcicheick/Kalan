/**
 * 
 */
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
 * @author Cheick Mahady Sissoko
 * @date 7 sept. 2014 19:14:52
 */
@SuppressWarnings("serial")
@Entity
@Table(name = "AS_PROFESSEURS_MATIERES")
@IdClass(ProfesseurMatiereId.class)
public class ProfesseurMatiere extends GenericModel {
	
	@Id
	@Column(name = "PROFESSEUR_ID")
	public Long professeurId;
	@Id
	@Column(name = "MATIERE_ID")
	public Long matiereId;
	
	@ManyToOne(cascade = CascadeType.PERSIST)
	@JoinColumn(name = "PROFESSEUR_ID", updatable = false, insertable = false, referencedColumnName = "id")
	public Professeur professeur;
	
	@ManyToOne(cascade = CascadeType.PERSIST)
	@JoinColumn(name = "MATIERE_ID", updatable = false, insertable = false, referencedColumnName = "id")
	public Matiere matiere;
	/**
	 * @param professeurId
	 * @param matiereId
	 */
	public ProfesseurMatiere(Long professeurId, Long matiereId) {
		this.professeurId = professeurId;
		this.matiereId = matiereId;
	}
	
	
}
