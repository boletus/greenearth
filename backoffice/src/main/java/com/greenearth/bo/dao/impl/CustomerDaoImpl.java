package com.greenearth.bo.dao.impl;

import org.springframework.stereotype.Repository;

import com.greenearth.bo.dao.CustomerDao;
import com.greenearth.bo.dao.Page;
import com.greenearth.bo.dao.hibernate.HibernateDao;
import com.greenearth.bo.domain.Customer;

@Repository
public class CustomerDaoImpl extends HibernateDao<Customer, Long> implements CustomerDao {

	@Override
	public Customer getCustomer(Long id) {
		return get(id);
	}

	@Override
	public Page<Customer> getCustomers(Page<Customer> p) {
		return super.findPage(p, "from Customer");
	}

	@Override
	public void saveCustomer(Customer c) {
		save(c);
	}

	@Override
	public void removeCustomer(Long id) {
		delete(id);
	}

}
