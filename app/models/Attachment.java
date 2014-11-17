/**
 * 
 */
package models;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import play.data.validation.Required;
import play.db.jpa.Blob;
import utils.FieldGroup;

/**
 * @author Cheick Mahady Sissoko
 * @date 8 sept. 2014 16:48:32
 */
@Entity
@Table(name = "T_ATTACHMENTS")
public class Attachment extends Standard {
	
	@Column(name = "DESCRIPTION")
	public String description;
	
	@Required(message = "required.attachment.fichier")
	@Column(name = "FICHIER")
	public Blob fichier;

	@FieldGroup(message = "required.attachment.eleve")
	@ManyToOne
	public Eleve eleve;
	
	@FieldGroup(message = "required.attachment.administrateur")
	@ManyToOne
	public Administrateur administrateur;
	
	@FieldGroup(message = "required.attachment.professeur")
	@ManyToOne
	public Professeur professeur;
	/**
	 * 
	 */
	public Attachment() {
		super();
	}

}
