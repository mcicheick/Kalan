/**
 * 
 */
package models;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

import play.db.jpa.JPABase;
import play.db.jpa.Model;

/**
 * @author Cheick Mahady Sissoko
 * @date 24 août 2014 10:30:41
 */
@Entity
@Table(name="T_MAINTENANCES")
public class Maintenance extends Standard {
	
	private static SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyyy");

	@Column(name = "TITLE")
	public String title;
	@Column(name = "CAUSE")
	public String cause;
	@Column(name = "ONGOING")
	public Boolean ongoing;
	@Column(name = "START_DATE")
	public Date startDate;
	@Column(name = "END_DATE")
	public Date endDate;
	@Column(name = "DATE_RANGE")
	public String daterange;
	
	public Maintenance() {
		super();
	}
	
	public static boolean isMaintenance() {
		return encours() != null;
	}
	
	public static Maintenance encours() {
		Date now = new Date();
		Maintenance maintenance = Maintenance.find("ongoing is ? and startDate < ? and endDate > ?", true, now, now).first();
		return maintenance;
	}
	
	@Override
	public <T extends JPABase> T save() {
		
		if(daterange != null) {
			String tab[] = daterange.split("-");
			if(tab.length == 2) {
				try {
					Date now = new Date();
					this.startDate = sdf.parse(tab[0].trim());
					this.endDate = sdf.parse(tab[1].trim());
					this.ongoing = now.after(startDate) && now.before(endDate);
				} catch (ParseException e) {
					e.printStackTrace();
				}
			}
		}
		return super.save();
	}
	
}
