package com.cinema.entity;

import java.util.Date;
import java.util.List;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.persistence.PreRemove;
import jakarta.persistence.Table;

@Entity
@Table(name = "Coupon")
public class Coupon {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int couponID;

    @Column(nullable = false)
    private String couponName;

    @Column(nullable = false)
    private String couponType;

    @Column(nullable = false)
    private double couponValue;

    @Column(nullable = false)
    private Date startDate;

    @Column(nullable = false)
    private Date endDate;

    @OneToMany(mappedBy = "coupon", orphanRemoval = false)
    private List<Payment> payments;
    @PreRemove
    private void preRemove() {
        // Hủy liên kết với tất cả các Payment trước khi xóa Coupon
        for (Payment payment : payments) {
            payment.setCoupon(null);
        }
    }
    
	public int getCouponID() {
		return couponID;
	}

	public void setCouponID(int couponID) {
		this.couponID = couponID;
	}

	public String getCouponName() {
		return couponName;
	}

	public void setCouponName(String couponName) {
		this.couponName = couponName;
	}

	public String getCouponType() {
		return couponType;
	}

	public void setCouponType(String couponType) {
		this.couponType = couponType;
	}

	public double getCouponValue() {
		return couponValue;
	}

	public void setCouponValue(double couponValue) {
		this.couponValue = couponValue;
	}

	public Date getStartDate() {
		return startDate;
	}

	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}

	public Date getEndDate() {
		return endDate;
	}

	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}

	public List<Payment> getPayments() {
		return payments;
	}

	public void setPayments(List<Payment> payments) {
		this.payments = payments;
	}

    // Getters and setters
    
    
}
