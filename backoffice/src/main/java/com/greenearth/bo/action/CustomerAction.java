package com.greenearth.bo.action;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import com.greenearth.bo.dao.Page;
import com.greenearth.bo.domain.City;
import com.greenearth.bo.domain.Customer;
import com.greenearth.bo.domain.District;
import com.greenearth.bo.service.CustomerManager;
import com.greenearth.bo.utils.Struts2Utils;

@SuppressWarnings("serial")
@Component
@Scope("prototype")
public class CustomerAction extends BaseAction {
	private Customer customer;
	private Long id;
	private String name;
	private String cellphone;
	private String streetAddress;
	private String barcode;
	
	@Autowired
	private CustomerManager customerManager;

	public Customer getCustomer() {
		return customer;
	}
	
	public void setId(Long id) {
		this.id = id;
	}

	public void setCustomer(Customer customer) {
		this.customer = customer;
	}

	public void setName(String name) {
		this.name = name;
	}

	public void setCellphone(String cellphone) {
		this.cellphone = cellphone;
	}

	public void setStreetAddress(String streetAddress) {
		this.streetAddress = streetAddress;
	}

	public void setBarcode(String barcode) {
		this.barcode = barcode;
	}
	
	@Override
	public String execute() throws Exception {
		return super.execute();
	}

	public void list() {
		Page<Customer> p = new Page<Customer>();
		p.setPageNo(start);
		p.setPageSize(limit);
		p = customerManager.getCustomers(p);
		Struts2Utils.renderJson(p, new String[] {});
	}
	
	public void delete() {
		customerManager.removeCustomer(id);
		Struts2Utils.renderJson("{success: true, msg: '删除成功'}", new String[] {});
	}
	
	public void save() {
		boolean isNew = (id == null ? true : false);
		Customer c = null;
		if (isNew) {
			c = new Customer();
			c.setName(name);
			c.setCellphone(cellphone);
			c.setStreetAddress(streetAddress);
			c.setBarcode(barcode);
		} else {
			c = customerManager.getCustomer(id);
			c.setName(name);
			c.setCellphone(cellphone);
			c.setStreetAddress(streetAddress);
			c.setBarcode(barcode);
		}
		
		// FIXME
		District d = new District();
		d.setId(1);
		City city = new City();
		city.setId(1);
		c.setDistrict(d);
		c.setCity(city);
		
		customerManager.saveCustomer(c);
		Struts2Utils.renderJson("{success: true, msg: '" + (isNew ? "添加" : "修改") + "成功'}", new String[] {});
	}
}
