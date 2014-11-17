/**
 * 
 */
package models;

import java.io.Serializable;


/**
 * @author Cheick Mahady Sissoko
 * @date 13 avr. 2014 16:09:25
 */
public class UserRightId implements Serializable {
    public long user_id;
    public long right_id;

    public UserRightId(long user_id, long right_id) {
        this.user_id = user_id;
        this.right_id = right_id;
    }

	/* (non-Javadoc)
	 * @see java.lang.Object#hashCode()
	 */
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + (int) (right_id ^ (right_id >>> 32));
		result = prime * result + (int) (user_id ^ (user_id >>> 32));
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
		UserRightId other = (UserRightId) obj;
		if (right_id != other.right_id)
			return false;
		if (user_id != other.user_id)
			return false;
		return true;
	}

	
}
