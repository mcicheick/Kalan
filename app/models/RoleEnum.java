/**
 * 
 */
package models;

/**
 * @author Cheick Mahady Sissoko
 * @date 8 juil. 2014 16:04:27
 */
public enum RoleEnum {
	
	ADMIN(1), MODERATOR(2), SU(3), USER(4);
	
	private int level;
	
	private RoleEnum(int level){
		this.level = level;
	}
	
	public int level(){
		return level;
	}
}
