/**
 * 
 */
package models;

import java.util.Date;
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
 * @date 7 sept. 2014 17:52:13
 */
@SuppressWarnings("serial")
@Entity
@Table(name = "T_EMPLOI_DU_TEMPS")
public class EmploiDuTemps extends Standard {
	
	@Required(message = "required.emploiDuTemps.dateDebut")
	@Column(name = "DATE_DEBUT")
	public Date dateDebut;
	@Required(message = "required.emploiDuTemps.dateFin")
	@Column(name = "DATE_FIN")
	public Date dateFin;

	@OneToMany(cascade = CascadeType.ALL, mappedBy = "emploiDuTemps")
	public List<CreneauHoraire> creneauHoraires;
	
	@OneToMany(cascade = CascadeType.DETACH, mappedBy = "emploiDuTemps")
	public List<Eleve> eleves;
	
	@OneToMany(cascade = CascadeType.DETACH, mappedBy = "emploiDuTemps")
	public List<Professeur> professeur;
	
	public EmploiDuTemps() {
		super();
	}
}
