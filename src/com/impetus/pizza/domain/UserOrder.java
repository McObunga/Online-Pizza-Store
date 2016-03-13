package com.impetus.pizza.domain;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

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
 

// TODO: Auto-generated Javadoc
/**
 * The Class UserOrder.
 */
@SuppressWarnings("serial")
/**
 * The Class UserOrder.
 */
@Entity
@Table(name = "userorder")
public class UserOrder implements Serializable {
	
	/** The detail id. */
	private int detailID;
	
	/**
	 * Gets the detail id.
	 *
	 * @return the detail id
	 */
	@Id
	@GeneratedValue
	@Column(name = "detailID", nullable = false)
	public int getDetailID() {
		return detailID;
	}
	
	/**
	 * Sets the detail id.
	 *
	 * @param detailID the new detail id
	 */
	public void setDetailID(int detailID) {
		this.detailID = detailID;
	}
	
	/**
	 * Gets the userrecord.
	 *
	 * @return the userrecord
	 */
    @ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "orderID", nullable = false)
	public UserRecord getUserrecord() {
		return userrecord;
	}
	
	/**
	 * Sets the userrecord.
	 *
	 * @param userrecord the new userrecord
	 */
	public void setUserrecord(UserRecord userrecord) {
		this.userrecord = userrecord;
	}
		
	/**
	 * Gets the product.
	 *
	 * @return the product
	 */
	@ManyToOne
	@JoinColumn(name = "productID", nullable = false)
	public Product getProduct() {
		return product;
	}
	
	/**
	 * Sets the product.
	 *
	 * @param product the new product
	 */
	public void setProduct(Product product) {
		this.product = product;
	}
	
	
	
	/**
	 * Gets the price.
	 *
	 * @return the price
	 */
	@Column(name = "price", nullable = false)
	public int getPrice() {
		return price;
	}
	
	/**
	 * Sets the price.
	 *
	 * @param price the new price
	 */
	public void setPrice(int price) {
		this.price = price;
	}
	
	/**
	 * Gets the addon.
	 *
	 * @return the addon
	 */
	@ManyToMany
	@JoinTable(name = "orderdetail", joinColumns = 
    { @JoinColumn(name = "detailID")}, inverseJoinColumns = { @JoinColumn(name = "ingredientID")} )
    public List<Ingredient> getAddon() {
		return addon;
	}
	
	/**
	 * Sets the addon.
	 *
	 * @param addon the new addon
	 */
	public void setAddon(List<Ingredient> addon) {
		this.addon = addon;
	}
		
	/**
	 * Gets the quantity.
	 *
	 * @return the quantity
	 */
	@Column(name = "quantity", nullable = false)
	public int getQuantity() {
		return quantity;
	}

	/**
	 * Sets the quantity.
	 *
	 * @param quantity the new quantity
	 */
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	/**
	 * Gets the size.
	 *
	 * @return the size
	 */
	@Column(name = "size", nullable = false)
	public String getSize() {
		return size;
	}

	/**
	 * Sets the size.
	 *
	 * @param size the new size
	 */
	public void setSize(String size) {
		this.size = size;
	}
	
	/**
	 * Gets the toppings.
	 *
	 * @return the toppings
	 */
	@Transient
	public String[] getToppings() {
		return toppings;
	}

	/**
	 * Sets the toppings.
	 *
	 * @param toppings the new toppings
	 */
	public void setToppings(String[] toppings) {
		this.toppings = toppings;
	}

	/**
	 * Gets the crust.
	 *
	 * @return the crust
	 */
	@Transient
	public String getCrust() {
		return crust;
	}

	/**
	 * Sets the crust.
	 *
	 * @param crust the new crust
	 */
	public void setCrust(String crust) {
		this.crust = crust;
	}

	/** The price. */
	private int price;
		
	/** The addon. */
	private List<Ingredient> addon = new ArrayList<Ingredient>();
	
	/** The toppings. */
	private String[] toppings;

	/** The crust. */
	private String crust ;
	
	/** The size. */
	private String size;

	/** The userrecord. */
	private UserRecord userrecord;
	
	/** The product. */
	private Product product;
	
	/** The quantity. */
	private int quantity;

}
