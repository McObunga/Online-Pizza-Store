package com.impetus.pizza.domain;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
  
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.persistence.UniqueConstraint;

import org.springframework.web.multipart.commons.CommonsMultipartFile;

// TODO: Auto-generated Javadoc
/**
 * The Class Product.
 */
@SuppressWarnings("serial")
@Entity
@Table(name = "product", uniqueConstraints = {
		@UniqueConstraint(columnNames = "productName")} )
public class Product implements Serializable{

	/** The product id. */
	private int productID;
	
	/**
	 * Gets the product id.
	 *
	 * @return the product id
	 */
	@Id
	@GeneratedValue
	@Column(name = "productID", nullable = false)
	public int getProductID() {
		return productID;
	}
	
	/**
	 * Sets the product id.
	 *
	 * @param productID the new product id
	 */
	public void setProductID(int productID) {
		this.productID = productID;
	}
	
	/**
	 * Gets the product name.
	 *
	 * @return the product name
	 */
	@Column(name = "productName", nullable = false)
	public String getProductName() {
		return productName;
	}
	
	/**
	 * Sets the product name.
	 *
	 * @param productName the new product name
	 */
	public void setProductName(String productName) {
		this.productName = productName;
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
	 * Gets the userlist.
	 *
	 * @return the userlist
	 */
	@ManyToMany(cascade = CascadeType.ALL)
	@JoinTable(name = "preference", joinColumns = 
	{ @JoinColumn(name = "productID")}, inverseJoinColumns = { @JoinColumn(name = "userID")} )
	public List<Userinfo> getUserlist() {
		return userlist;
	}
	
	/**
	 * Sets the userlist.
	 *
	 * @param userlist the new userlist
	 */
	public void setUserlist(List<Userinfo> userlist) {
		this.userlist = userlist;
	}
	
	/**
	 * Gets the description.
	 *
	 * @return the description
	 */
	@Column(name = "description", nullable = false)
	public String getDescription() {
		return description;
	}

	/**
	 * Sets the description.
	 *
	 * @param description the new description
	 */
	public void setDescription(String description) {
		this.description = description;
	}

	/**
	 * Gets the image.
	 *
	 * @return the image
	 */
	@Column(name = "image", nullable = false)
	public String getImage() {
		return image;
	}

	/**
	 * Sets the image.
	 *
	 * @param image the new image
	 */
	public void setImage(String image) {
		this.image = image;
	}

	/**
	 * Gets the ingredientlist.
	 *
	 * @return the ingredientlist
	 */
	@ManyToMany(fetch=FetchType.EAGER)
	@JoinTable(name = "productingredient", joinColumns = 
	{ @JoinColumn(name = "productID")}, inverseJoinColumns = { @JoinColumn(name = "ingredientID")} )
	public List<Ingredient> getIngredientlist() {
		return ingredientlist;
	}

	/**
	 * Sets the ingredientlist.
	 *
	 * @param ingredientlist the new ingredientlist
	 */
	public void setIngredientlist(List<Ingredient> ingredientlist) {
		this.ingredientlist = ingredientlist;
	}
	
	/**
	 * Gets the file data.
	 *
	 * @return the file data
	 */
	@Transient
	public CommonsMultipartFile getFileData() {
		return fileData;
	}

	/**
	 * Sets the file data.
	 *
	 * @param fileData the new file data
	 */
	public void setFileData(CommonsMultipartFile fileData) {
		this.fileData = fileData;
	}
		
	/**
	 * Gets the topping list.
	 *
	 * @return the topping list
	 */
	@Transient
	public String[] getToppingList() {
		return toppingList;
	}

	/**
	 * Sets the topping list.
	 *
	 * @param toppingList the new topping list
	 */
	public void setToppingList(String[] toppingList) {
		this.toppingList = toppingList;
	}
	
	/** The product name. */
	private String productName = "";
	
	/** The psmall. */
	private int psmall;
	
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

	/** The plarge. */
	private int plarge;
	
	/** The pmedium. */
	private int pmedium;
	
	/** The category. */
	private Category category;
	
	/** The image. */
	private String image;
	
	/** The description. */
	private String description;
	
	/** The file data. */
	private CommonsMultipartFile fileData;
	
	/** The userlist. */
	private List<Userinfo> userlist = new ArrayList<Userinfo>();
	
	/** The ingredientlist. */
	private List<Ingredient> ingredientlist = new ArrayList<Ingredient>();
	
	/** The topping list. */
	private String[] toppingList;
    	
}
