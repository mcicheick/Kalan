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
@Table(name = "AS_ELEVES_MATIERES")
@IdClass(EleveMatiereId.class)
public class EleveMatiere extends GenericModel {

	@Id
	@Column(name = "ELEVE_ID")
	public Long eleveId;
	@Id
	@Column(name = "MATIERE_ID")
	public Long matiereId;

	@ManyToOne(cascade = CascadeType.PERSIST)
	@JoinColumn(name = "eleve_id", updatable = false, insertable = false, referencedColumnName = "id")
	public Eleve eleve;

	@ManyToOne(cascade = CascadeType.PERSIST)
	@JoinColumn(name = "MATIERE_ID", updatable = false, insertable = false, referencedColumnName = "id")
	public Matiere matiere;

	/**
	 * @param eleveId
	 * @param matiereId
	 */
	public EleveMatiere(Long eleveId, Long matiereId) {
		this.eleveId = eleveId;
		this.matiereId = matiereId;
	}

	@Override
	public String toString() {
		if (eleve != null && matiere != null)
			return "EleveMatiere[" + eleveId + ", " + matiereId + "]("
					+ eleve.nom + ", " + matiere.code + ")";
		return super.toString();
	}

}
