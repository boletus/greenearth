package com.greenearth.bo.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.greenearth.bo.dao.CustomerDao;
import com.greenearth.bo.dao.Page;
import com.greenearth.bo.domain.Customer;

@Service
@Transactional
public class CustomerManager {
	@Autowired
	private CustomerDao customerDao;

	@Transactional(readOnly = true)
	public Customer getCustomer(Long id) {
		return customerDao.getCustomer(id);
	}

	@Transactional(readOnly = true)
	public Page<Customer> getCustomers(Page<Customer> p) {
		return customerDao.getCustomers(p);
	}

	public void saveCustomer(Customer c) {
		customerDao.saveCustomer(c);
	}

	public void removeCustomer(Long id) {
		customerDao.removeCustomer(id);
	}
	
	
}
