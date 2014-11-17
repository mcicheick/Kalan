/**
 * 
 */
package models;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.MappedSuperclass;

import play.db.jpa.JPABase;
import play.db.jpa.Model;


/**
 * This class is the parent of all models. It has all common fields
 * @author Cheick Mahady Sissoko
 * @date 1 sept. 2014 19:27:44
 */
@SuppressWarnings("serial")
@MappedSuperclass
public abstract class Standard extends Model {
	
	@Column(name = "CREATE_DATE")
	public Date createDate;
	@Column(name = "MODIFY_DATE")
	public Date modifyDate;
	
	public Standard() {
		createDate = new Date();
		modifyDate = new Date();
	}
	
	@Override
	public <T extends JPABase> T save() {
		modifyDate = new Date();
		return super.save();
	}
	
	public <T extends JPABase> T simpleSave() {
		return super.save();
	}
}
