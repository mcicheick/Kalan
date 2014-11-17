/**
 * 
 */
package models;

import java.io.Serializable;

/**
 * @author Cheick Mahady Sissoko
 * @date 7 sept. 2014 19:16:04
 */
@SuppressWarnings("serial")
public class ProfesseurMatiereId implements Serializable {
	
	private long professeurId;
	private long matiereId;
	/**
	 * @param professeurId
	 * @param matiereId
	 */
	public ProfesseurMatiereId(long professeurId, long matiereId) {
		this.professeurId = professeurId;
		this.matiereId = matiereId;
	}
	/* (non-Javadoc)
	 * @see java.lang.Object#hashCode()
	 */
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + (int) (professeurId ^ (professeurId >>> 32));
		result = prime * result + (int) (matiereId ^ (matiereId >>> 32));
		return result;
	}
	/* (non-Javadoc)
	 * @see java.lang.Object#equals(java.lang.Object)
	 */
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		ProfesseurMatiereId other = (ProfesseurMatiereId) obj;
		if (professeurId != other.professeurId)
			return false;
		if (matiereId != other.matiereId)
			return false;
		return true;
	}
	
	
}
