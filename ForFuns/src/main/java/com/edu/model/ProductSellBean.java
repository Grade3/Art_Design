package com.edu.model;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;


/**
 * 商品出售方式表
 * @author Gy
 *
 */
@Table(name="ps_productsell")
@Entity
public class ProductSellBean {
	private Integer id;
	private ProductBean productBean;

	private SellMethodBean sellMethodBean;
	public ProductSellBean(Integer id, ProductBean productBean,
			SellMethodBean sellMethodBean) {
		super();
		this.id = id;
		this.productBean = productBean;
		this.sellMethodBean = sellMethodBean;
	}
	public ProductSellBean() {
		super();
	}
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id")
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	@OneToOne  
    @JoinColumn(name="productid") 
	public ProductBean getProductBean() {
		return productBean;
	}
	
	public void setProductBean(ProductBean productBean) {
		this.productBean = productBean;
	}
	@ManyToOne(cascade=CascadeType.ALL,fetch=FetchType.EAGER)
	@JoinColumn(name="sellmethodid")
	public SellMethodBean getSellMethodBean() {
		return sellMethodBean;
	}
	public void setSellMethodBean(SellMethodBean sellMethodBean) {
		this.sellMethodBean = sellMethodBean;
	}
}
