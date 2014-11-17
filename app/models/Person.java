/**
 * 
 */
package models;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Lob;
import javax.persistence.MappedSuperclass;
import javax.validation.constraints.Size;

import net.sf.oval.constraint.MinSize;
import play.data.validation.Email;
import play.data.validation.Min;
import play.data.validation.Password;
import play.data.validation.Required;
import play.data.validation.Unique;
import play.db.jpa.Blob;


/**
 * @author Cheick Mahady Sissoko
 * @date 7 sept. 2014 18:34:16
 */
@SuppressWarnings("serial")
@MappedSuperclass
public class Person extends Standard {
	
	@Required(message = "required.person.prenom")
	@Column(name = "PRENOM")
	public String prenom;
	
	@Required(message = "required.person.nom")
	@Column(name = "NOM")
	public String nom;
	
	@Required(message = "required.person.dateNaissance")
	@Column(name = "DATE_NAISSANCE")
	public Date dateNaissance;
	
	@Required(message = "required.person.login")
	@Unique(message = "unique.person.login")
	@Column(name = "LOGIN")
	@Size(min = 6, message = "valid.person.login")
	public String login;
	
	@Required(message = "required.person.email")
	@Email(message = "valid.person.email")
	@Unique(message = "unique.person.email")
	@Column(name = "EMAIL")
	public String email;
	
	@Required(message = "required.person.password")
	@Size(min = 8, message = "valid.person.password")
	@Column(name = "PASSWORD")
	@Password
	public String password;
	
	@Column(name = "PHOTO")
	public Blob photo;
	
	@Lob
	@Column(name = "DESCRIPTION")
	public String description;
	
	public Person() {
		super();
	}
	
	@Override
	public String toString() {
		return super.toString() + "(" + prenom + " " + nom + ")";
	}
}
