package com.impetus.pizza.domain;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;

// TODO: Auto-generated Javadoc
/**
 * The Class Category.
 */
@SuppressWarnings("serial")
@Entity
@Table(name = "category", uniqueConstraints = {
		@UniqueConstraint(columnNames = "categoryType")})
public class Category implements Serializable{

	/** The category id. */
	private int categoryID;
	
	/**
	 * Gets the category id.
	 *
	 * @return the category id
	 */
	@Id
	@GeneratedValue
	@Column(name = "categoryID")
	public int getCategoryID() {
		return categoryID;
	}
	
	/**
	 * Sets the category id.
	 *
	 * @param categoryID the new category id
	 */
	public void setCategoryID(int categoryID) {
		this.categoryID = categoryID;
	}
	
	/**
	 * Gets the category type.
	 *
	 * @return the category type
	 */
	@Column(name = "categoryType", nullable = false)
	public String getCategoryType() {
		return categoryType;
	}
	
	/**
	 * Sets the category type.
	 *
	 * @param categoryType the new category type
	 */
	public void setCategoryType(String categoryType) {
		this.categoryType = categoryType;
	}
	
	/** The category type. */
	private String categoryType;
   	
}
