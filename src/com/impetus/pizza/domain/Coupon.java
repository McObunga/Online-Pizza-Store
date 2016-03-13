package com.impetus.pizza.domain;

import java.io.Serializable;
 
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

// TODO: Auto-generated Javadoc
/**
 * The Class Coupon.
 */
@SuppressWarnings("serial")
@Entity
@Table(name = "coupon")
public class Coupon implements Serializable {

	/** The Id. */
	private int Id;
	
	/**
	 * Gets the id.
	 *
	 * @return the id
	 */
	@Id
	@GeneratedValue
	@Column(name = "ID", nullable = false)
	public int getId() {
		return Id;
	}
	
	/**
	 * Sets the id.
	 *
	 * @param id the new id
	 */
	public void setId(int id) {
		Id = id;
	}
	
	/**
	 * Gets the coupon no.
	 *
	 * @return the coupon no
	 */
	@Column(name = "couponNo", nullable = false)
	public String getCouponNo() {
		return couponNo;
	}
	
	/**
	 * Sets the coupon no.
	 *
	 * @param couponNo the new coupon no
	 */
	public void setCouponNo(String couponNo) {
		this.couponNo = couponNo;
	}
	
	/**
	 * Gets the start date.
	 *
	 * @return the start date
	 */
	@Column(name = "startDate", nullable = false)
	public String getStartDate() {
		return startDate;
	}
	
	/**
	 * Sets the start date.
	 *
	 * @param startDate the new start date
	 */
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	
	/**
	 * Gets the end date.
	 *
	 * @return the end date
	 */
	@Column(name = "endDate", nullable = false)
	public String getEndDate() {
		return endDate;
	}
	
	/**
	 * Sets the end date.
	 *
	 * @param endDate the new end date
	 */
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	
	/**
	 * Checks if is status.
	 *
	 * @return true, if is status
	 */
	@Column(name = "isActive", nullable = false)
	public boolean isStatus() {
		return status;
	}
	
	/**
	 * Sets the status.
	 *
	 * @param status the new status
	 */
	public void setStatus(boolean status) {
		this.status = status;
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
	
	/** The coupon no. */
	private String couponNo;
	
	/** The start date. */
	private String startDate;
	
	/** The end date. */
	private String endDate;
	
	/** The status. */
	private boolean status;
	
	/** The discount. */
	private int discount;

}
