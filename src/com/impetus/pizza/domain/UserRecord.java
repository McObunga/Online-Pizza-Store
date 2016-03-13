package com.impetus.pizza.domain;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

// TODO: Auto-generated Javadoc
/**
 * The Class UserRecord.
 */
@SuppressWarnings("serial")
/**
 * The Class UserRecord.
 */
@Entity
@Table(name = "userrecord")
public class UserRecord implements Serializable {

	/** The order id. */
	private int orderID;
	
	/**
	 * Gets the order id.
	 *
	 * @return the order id
	 */
	@Id
	@GeneratedValue
	@Column(name = "orderID", nullable = false)
	public int getOrderID() {
		
		return orderID;
	}

	/**
	 * Sets the order id.
	 *
	 * @param orderID the new order id
	 */
	public void setOrderID(int orderID) {
		this.orderID = orderID;
	}
	
	/**
	 * Gets the userinfo.
	 *
	 * @return the userinfo
	 */
	@ManyToOne
	@JoinColumn(name = "userID", nullable = false)
	public Userinfo getUserinfo() {
		return userinfo;
	}
	
	/**
	 * Sets the userinfo.
	 *
	 * @param userinfo the new userinfo
	 */
	public void setUserinfo(Userinfo userinfo) {
		this.userinfo = userinfo;
	}
		
	/**
	 * Gets the amount.
	 *
	 * @return the amount
	 */
	@Column(name = "amount", nullable = false)
	public int getAmount() {
		return amount;
	}
	
	/**
	 * Sets the amount.
	 *
	 * @param amount the new amount
	 */
	public void setAmount(int amount) {
		this.amount = amount;
	}
	
	/**
	 * Gets the order type.
	 *
	 * @return the order type
	 */
	@Column(name = "orderType", nullable = false)
	public String getOrderType() {
		return orderType;
	}
	
	/**
	 * Sets the order type.
	 *
	 * @param orderType the new order type
	 */
	public void setOrderType(String orderType) {
		this.orderType = orderType;
	}
	
	/**
	 * Gets the order date.
	 *
	 * @return the order date
	 */
	@Column(name = "orderDate", nullable = false)
	public Date getOrderDate() {
		return orderDate;
	}

	/**
	 * Sets the order date.
	 *
	 * @param orderDate the new order date
	 */
	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}

	/**
	 * Gets the delivery address.
	 *
	 * @return the delivery address
	 */
	@Column(name = "deliveryAddress")
	public String getDeliveryAddress() {
		return deliveryAddress;
	}

	/**
	 * Sets the delivery address.
	 *
	 * @param deliveryAddress the new delivery address
	 */
	public void setDeliveryAddress(String deliveryAddress) {
		this.deliveryAddress = deliveryAddress;
	}
		
	/**
	 * Gets the discount.
	 *
	 * @return the discount
	 */
	@Column(name = "discount", nullable = false)
	public int getDiscount() {
		return discount;
	}

	/**
	 * Sets the discount.
	 *
	 * @param discount the new discount
	 */
	public void setDiscount(int discount) {
		this.discount = discount;
	}

	/**
	 * Gets the grand total.
	 *
	 * @return the grand total
	 */
	@Column(name = "grandtotal", nullable = false)
	public int getGrandTotal() {
		return grandTotal;
	}

	/**
	 * Sets the grand total.
	 *
	 * @param grandTotal the new grand total
	 */
	public void setGrandTotal(int grandTotal) {
		this.grandTotal = grandTotal;
	}
		
	/**
	 * Gets the orderlist.
	 *
	 * @return the orderlist
	 */
	@OneToMany(cascade = CascadeType.ALL, fetch=FetchType.EAGER, mappedBy = "userrecord")
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

	/** The discount. */
	private int discount;
	
	/** The grand total. */
	private int grandTotal;
	
	/** The userinfo. */
	
	private Userinfo userinfo;
	
	/** The amount. */
	private int amount;
	
	/** The order type. */
	private String orderType;

	/** The order date. */
	private Date orderDate;
	
	/** The delivery address. */
	private String deliveryAddress;
	
	/** The orderlist. */
	private List<UserOrder> orderlist = new ArrayList<UserOrder>();
	
}
