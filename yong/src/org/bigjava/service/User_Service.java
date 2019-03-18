package org.bigjava.service;

import java.util.List;


import org.bigjava.domain.User;
import org.bigjava.domain.PageBean;
import org.bigjava.domain.User;

public interface User_Service {

	 PageBean<User> findByPage(Integer currPage);
		
	User save(User user);

	void update(User user);

	 User findById(Integer usr_id);

	void delete(User user);
	
	List<User> findAll();

	User login(User user);

	

	User zhuce(User user);

	List<User> mohucha(User user);

	User fasong(User user);

	
}
