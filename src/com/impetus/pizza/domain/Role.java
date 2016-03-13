
package com.impetus.pizza.domain;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

// TODO: Auto-generated Javadoc
/**
 * The Class Role.
 */
@SuppressWarnings("serial")
/**
 * The Class Role.
 */
@Entity
@Table(name = "role")
public class Role implements Serializable {
    
	/** The role id. */
	private int roleID;

	/**
	 * Gets the role id.
	 *
	 * @return the role id
	 */
	@Id
	@GeneratedValue
	@Column(name = "roleID")
	public int getRoleID() {
		return roleID;
	}

	/**
	 * Sets the role id.
	 *
	 * @param roleID the new role id
	 */
	public void setRoleID(int roleID) {
		this.roleID = roleID;
	}

	/**
	 * Gets the role type.
	 *
	 * @return the role type
	 */
	@Column(name = "roleType", nullable = false)
	public String getRoleType() {
		return roleType;
	}

	/**
	 * Sets the role type.
	 *
	 * @param roleType the new role type
	 */
	public void setRoleType(String roleType) {
		this.roleType = roleType;
	}

	/** The role type. */
	private String roleType;
}
