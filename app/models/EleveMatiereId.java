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
public class EleveMatiereId implements Serializable {
	
	private long eleveId;
	private long matiereId;
	/**
	 * @param eleveId
	 * @param matiereId
	 */
	public EleveMatiereId(long eleveId, long matiereId) {
		this.eleveId = eleveId;
		this.matiereId = matiereId;
	}
	/* (non-Javadoc)
	 * @see java.lang.Object#hashCode()
	 */
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + (int) (eleveId ^ (eleveId >>> 32));
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
		EleveMatiereId other = (EleveMatiereId) obj;
		if (eleveId != other.eleveId)
			return false;
		if (matiereId != other.matiereId)
			return false;
		return true;
	}
	
	
}
