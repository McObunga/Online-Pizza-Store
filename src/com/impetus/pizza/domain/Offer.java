package com.impetus.pizza.domain;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

// TODO: Auto-generated Javadoc
/**
 * The Class Offer.
 */
@SuppressWarnings("serial")
@Entity
@Table(name = "offer")
public class Offer implements Serializable{

	/** The offer id. */
	private int offerId;
	
	/**
	 * Gets the offer id.
	 *
	 * @return the offer id
	 */
	@Id
	@GeneratedValue
	@Column(name = "offerId", nullable = false)
	public int getOfferId() {
		return offerId;
	}
	
	/**
	 * Sets the offer id.
	 *
	 * @param offerId the new offer id
	 */
	public void setOfferId(int offerId) {
		this.offerId = offerId;
	}
	
	/**
	 * Gets the offer name.
	 *
	 * @return the offer name
	 */
	@Column(name = "offerName", nullable = false)
	public String getOfferName() {
		return offerName;
	}
	
	/**
	 * Sets the offer name.
	 *
	 * @param offerName the new offer name
	 */
	public void setOfferName(String offerName) {
		this.offerName = offerName;
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
	 * Gets the quantity.
	 *
	 * @return the quantity
	 */
	@Column(name = "offerOnQuantity")
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
	 * Gets the amount.
	 *
	 * @return the amount
	 */
	@Column(name = "offerOnAmount")
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
	
	/** The offer name. */
	private String offerName;
	
	/** The discount. */
	private int discount;
	
	/** The quantity. */
	private int quantity;
	
	/** The amount. */
	private int amount;
	
	/** The start date. */
	private String startDate;
	
	/** The end date. */
	private String endDate;
}
