package org.bigjava.dao;

import java.util.List;


import org.bigjava.domain.User;

public interface User_Dao {

	int findCount();

	List<User> findByPage(int begin, int pageSize);

	void update(User user);

	User findById(Integer user_id);

	List<User> findAll();

	void delete(User user);

	User findByAccountAndPassword(User user);

	User findByxiuAndPassword(User user);

	User save(User user);

	User findByZhuCe(User user);

	


}