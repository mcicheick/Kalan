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
 * @date 7 sept. 2014 17:51:57
 */
@SuppressWarnings("serial")
@Entity
@Table(name = "T_SALLES")
public class Salle extends Standard {
	
	@Required(message = "required.salle.code")
	@Column(name = "CODE")
	public String code;
	
	@Required(message = "required.salle.batiment")
	@Column(name = "BATIMENT")
	public String batiment;
	
	@OneToMany(cascade = CascadeType.ALL, mappedBy = "salle")
	public List<CreneauHoraire> creneauHoraires;

	public Salle() {
		super();
	}
}
