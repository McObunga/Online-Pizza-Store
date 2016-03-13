package com.impetus.pizza.domain;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.persistence.UniqueConstraint;

// TODO: Auto-generated Javadoc
/**
 * The Class Userinfo.
 */
@SuppressWarnings("serial")
/**
 * The Class Userinfo.
 */
@Entity
@Table(name = "userinfo", uniqueConstraints = {
		@UniqueConstraint(columnNames = "userName") })
public class Userinfo implements Serializable {

	/**
	 * Instantiates a new userinfo.
	 */
	public Userinfo() {
		
	}

	/**
	 * Instantiates a new userinfo.
	 *
	 * @param string the string
	 * @param string3 the string3
	 * @param string4 the string4
	 * @param i the i
	 */
	public Userinfo(String string, String string3,
			String string4, String i) {
		// TODO Auto-generated constructor stub
		this.userAddress1 = string;
		this.userMobile = string3;
		this.userName = string4;
		this.userPassword = i;
	}


	/** The user id. */
	private int userID;
	
	/**
	 * Gets the user id.
	 *
	 * @return the user id
	 */
	@Id
	@GeneratedValue
	@Column(name = "userID", nullable = false)
	public int getUserID() {
		return userID;
	}

	/**
	 * Sets the user id.
	 *
	 * @param userID the new user id
	 */
	public void setUserID(int userID) {
		this.userID = userID;
	}

	/**
	 * Gets the user name.
	 *
	 * @return the user name
	 */
	@Column(name = "userName", nullable = false)
	public String getUserName() {
		return userName;
	}

	/**
	 * Sets the user name.
	 *
	 * @param userName the new user name
	 */
    public void setUserName(String userName) {
		this.userName = userName;
	}

	/**
	 * Gets the user password.
	 *
	 * @return the user password
	 */
    //@Size(min = 5, max = 20, message = "Please enter a valid username (5-20 characters)")
	@Column(name = "userPassword", nullable = false)
	public String getUserPassword() {
		return userPassword;
	}

	/**
	 * Sets the user password.
	 *
	 * @param userPassword the new user password
	 */
	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}
	
	
	/**
	 * Gets the user mobile.
	 *
	 * @return the user mobile
	 */
	@Column(name = "userMobile", nullable = false)
	public String getUserMobile() {
		return userMobile;
	}
	
	/**
	 * Sets the user mobile.
	 *
	 * @param userMobile the new user mobile
	 */
	public void setUserMobile(String userMobile) {
		this.userMobile = userMobile;
	}
	
	/**
	 * Gets the user address1.
	 *
	 * @return the user address1
	 */
	@Column(name = "userAddress", nullable = false)
	public String getUserAddress1() {
		return userAddress1;
	}
	
	/**
	 * Sets the user address1.
	 *
	 * @param userAddress the new user address1
	 */
	public void setUserAddress1(String userAddress) {
		this.userAddress1 = userAddress;
	}
	
	/**
	 * Gets the role.
	 *
	 * @return the role
	 */
	@ManyToOne
	@JoinColumn(name = "roleID")
	public Role getRole() {
		return role;
	}
	
	/**
	 * Sets the role.
	 *
	 * @param role the new role
	 */
	public void setRole(Role role) {
		this.role = role;
	}

	/**
	 * Gets the confirm password.
	 *
	 * @return the confirm password
	 */
	@Transient
	public String getConfirmPassword() {
		return confirmPassword;
	}

	/**
	 * Sets the confirm password.
	 *
	 * @param confirmPassword the new confirm password
	 */
	public void setConfirmPassword(String confirmPassword) {
		this.confirmPassword = confirmPassword;
	}

	/** The user name. */
	private String userName = "";

	/** The user password. */
	private String userPassword = "";

	/** The user mobile. */
	private String userMobile = "";

	/** The user address1. */
	private String userAddress1 = "";
	
    /** The role. */
    private Role role;

    /** The confirm password. */
    private String confirmPassword = "";
    
    /** The productlist. */
    private List<Product> productlist = new ArrayList<Product>();

    /**
     * Gets the productlist.
     *
     * @return the productlist
     */
    @ManyToMany(cascade = CascadeType.ALL)
	@JoinTable(name = "preference", joinColumns = 
	{ @JoinColumn(name = "userID")}, inverseJoinColumns = { @JoinColumn(name = "productID")} )
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

	/** The pizzalist. */
	private String[] pizzalist;

	/**
	 * Gets the pizzalist.
	 *
	 * @return the pizzalist
	 */
	@Transient
	public String[] getPizzalist() {
		return pizzalist;
	}

	/**
	 * Sets the pizzalist.
	 *
	 * @param pizzalist the new pizzalist
	 */
	public void setPizzalist(String[] pizzalist) {
		this.pizzalist = pizzalist;
	}
	
	
}
