/**
 * 
 */
package models;

import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.validation.constraints.Pattern;

import play.data.validation.Required;


/**
 * @author Cheick Mahady Sissoko
 * @date 7 sept. 2014 17:55:56
 */
@SuppressWarnings("serial")
@Entity
@Table(name = "T_CRENEAU_HORAIRES")
public class CreneauHoraire extends Standard {
	
	public enum TypeCreneau {
		COURS, TD, OTHERS
	}
	
	@Required(message = "required.creneauHoraire.typeCreneau")
	@Enumerated(EnumType.STRING)
	@Column(name = "TYPE_CRENEAU")
	public TypeCreneau typeCreneau;
	
	@Column(name = "DESCRIPTION")
	public String description;
	
	@Required(message = "required.creneauHoraire.dateCreneau")
	@Column(name = "DATE_CRENEAU")
	public Date dateCreneau;
	
	@Pattern(regexp = "([0-1][0-9]|2[0-3]):([0-5][0-9])", message = "valid.creneauHoraire.heureDebut")
	@Required(message = "required.creneauHoraire.heureDebut")
	@Column(name = "HEURE_DEBUT")
	public String heureDebut;
	
	@Pattern(regexp = "([0-1][0-9]|2[0-3]):([0-5][0-9])", message = "valid.creneauHoraire.heureFin")
	@Column(name = "HEURE_FIN")
	@Required(message = "required.creneauHoraire.heureFin")
	public String heureFin;
	
	@ManyToOne
	public Salle salle;
	
	@ManyToOne
	public Matiere matiere;
	
	@ManyToOne
	public EmploiDuTemps emploiDuTemps;
	
	public CreneauHoraire() {
		super();
	}

}
