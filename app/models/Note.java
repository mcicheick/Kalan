/**
 * 
 */
package models;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.validation.constraints.Pattern;

import play.data.validation.Required;
import utils.FieldGroup;

/**
 * @author Cheick Mahady Sissoko
 * @date 7 sept. 2014 20:11:25
 */
@SuppressWarnings("serial")
@Entity
@Table(name = "T_NOTES")
public class Note extends Standard {

	public enum Periode {
		TRIMESTRE1("Premier trimestre"), TRIMESTRE2("Deuxième trimestre"), TRIMESTRE3(
				"Troisième trimestre"), SEMESTRE1("Premier semestre"), SEMESTRE2(
				"Second semestre");
		public String title;

		private Periode(String title) {
			this.title = title;
		}
	}

	@Required(message = "required.note.coef")
	@Column(name = "COEF")
	public Double coef;

	@Required(message = "required.note.note")
	@Column(name = "VALUE")
	public Double note;

	@Required(message = "required.note.periode")
	@Enumerated(EnumType.STRING)
	@Column(name = "PERIODE")
	public Periode periode;

	@Required(message = "required.note.annee")
	@Pattern(regexp = "[0-9]{4}", message = "valid.note.annee")
	@Column(name = "ANNEE")
	public String annee;

	@Required(message = "required.note.codeMatiere")
	@Column(name = "CODE_MATIERE")
	public String codeMatiere;

	@Required(message = "required.note.eleve")
	@ManyToOne
	public Eleve eleve;

	/**
	 * 
	 */
	public Note() {
		super();
	}

	@Override
	public String toString() {
		if (eleve != null)
			return super.toString() + "(" + coef + ", " + note + ", "
					+ codeMatiere + ", " + eleve.nom + ")";
		return super.toString();
	}
}
