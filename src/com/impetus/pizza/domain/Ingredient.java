package com.impetus.pizza.domain;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List; 

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.UniqueConstraint;
import javax.persistence.Table;

// TODO: Auto-generated Javadoc
/**
 * The Class Ingredient.
 */
@SuppressWarnings("serial")
@Entity
@Table(name = "ingredient", uniqueConstraints = {
		@UniqueConstraint(columnNames = "ingredientName")} )
public class Ingredient implements Serializable{

	/** The ingredient id. */
	private int ingredientID;
	
	/**
	 * Gets the ingredient id.
	 *
	 * @return the ingredient id
	 */
	@Id
	@GeneratedValue
	@Column(name = "ingredientID", nullable = false)
	public int getIngredientID() {
		return ingredientID;
	}
	
	/**
	 * Sets the ingredient id.
	 *
	 * @param ingredientID the new ingredient id
	 */
	public void setIngredientID(int ingredientID) {
		this.ingredientID = ingredientID;
	}
	
	/**
	 * Gets the ingredient name.
	 *
	 * @return the ingredient name
	 */
	@Column(name = "ingredientName", nullable = false)
	public String getIngredientName() {
		return ingredientName;
	}
	
	/**
	 * Sets the ingredient name.
	 *
	 * @param ingredientName the new ingredient name
	 */
	public void setIngredientName(String ingredientName) {
		this.ingredientName = ingredientName;
	}
	
	/**
	 * Gets the psmall.
	 *
	 * @return the psmall
	 */
	@Column(name = "psmall", nullable = false)
	public int getPsmall() {
		return psmall;
	}
	
	/**
	 * Sets the psmall.
	 *
	 * @param psmall the new psmall
	 */
	public void setPsmall(int psmall) {
		this.psmall = psmall;
	}
	
	/**
	 * Gets the pmedium.
	 *
	 * @return the pmedium
	 */
	@Column(name = "pmedium", nullable = false)
	public int getPmedium() {
		return pmedium;
	}
	
	/**
	 * Sets the pmedium.
	 *
	 * @param pmedium the new pmedium
	 */
	public void setPmedium(int pmedium) {
		this.pmedium = pmedium;
	}
	
	/**
	 * Gets the plarge.
	 *
	 * @return the plarge
	 */
	@Column(name = "plarge", nullable = false)
	public int getPlarge() {
		return plarge;
	}
	
	/**
	 * Sets the plarge.
	 *
	 * @param plarge the new plarge
	 */
	public void setPlarge(int plarge) {
		this.plarge = plarge;
	}
	
	/**
	 * Gets the category.
	 *
	 * @return the category
	 */
	@ManyToOne
	@JoinColumn(name = "categoryID")
	public Category getCategory() {
		return category;
	}
	
	/**
	 * Sets the category.
	 *
	 * @param category the new category
	 */
	public void setCategory(Category category) {
		this.category = category;
	}
	
	/**
	 * Gets the productlist.
	 *
	 * @return the productlist
	 */
	@ManyToMany(mappedBy = "ingredientlist")
	public List<Product> getProductlist() {
		return productlist;
	}

	/**
	 * Sets the productlist.
	 *
	 * @param productlist the new productlist
	 */
	public void setProductlist(List<Product> productlist) {
		this.productlist = productlist;
	}
	
	/** The ingredient name. */
	private String ingredientName = "";
	
	/** The psmall. */
	private int psmall;
	
	/** The pmedium. */
	private int pmedium;
	
	/** The plarge. */
	private int plarge;
	
	/** The category. */
	private Category category;
	
	/** The productlist. */
	private List<Product> productlist = new ArrayList<Product>();
	
	/** The orderlist. */
	private List<UserOrder> orderlist = new ArrayList<UserOrder>();

	/**
	 * Gets the orderlist.
	 *
	 * @return the orderlist
	 */
	@ManyToMany(mappedBy = "addon")
	public List<UserOrder> getOrderlist() {
		return orderlist;
	}

	/**
	 * Sets the orderlist.
	 *
	 * @param orderlist the new orderlist
	 */
	public void setOrderlist(List<UserOrder> orderlist) {
		this.orderlist = orderlist;
	}
	
}
