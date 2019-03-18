package org.bigjava.service.impl;

import java.util.List;
import org.bigjava.dao.User_Dao;
import org.bigjava.domain.PageBean;
import org.bigjava.domain.User;
import org.bigjava.service.User_Service;

public class User_Serviceimpl implements User_Service{
	
	private User_Dao userDao;
	private Object getHibernateTemplate;
	
	public void setUserDao(User_Dao userDao) {
		this.userDao = userDao;
	}
    /**
          *service 登录的方法
     */
	@Override
	public User login(User user) {
		User existuser = userDao.findByAccountAndPassword(user);
		return existuser;
	}
	/**
	 * service 分页查询的方法
	 * 
	 */
	public PageBean<User> findByPage(Integer currPage) {
		PageBean<User> pageBean = new PageBean<User>();
		
		pageBean.setCurrPage(currPage);
	
		int pageSize = 5;
		pageBean.setPageSize(pageSize);
		
		int totalCount = userDao.findCount();
		pageBean.setTotalCount(totalCount);
		
		double tc = totalCount;
		Double num = Math.ceil(tc / pageSize);
		pageBean.setTotalPage(num.intValue());
		
		int begin =(currPage - 1) * pageSize;
		List<User> list = userDao.findByPage(begin,pageSize);
		pageBean.setList(list);
		return pageBean;
		
	}

	@Override
      /**
               * 添加
       */
	public User save(User user) {
		 User saveuser = userDao.findByZhuCe(user);
			return saveuser;
		
	}

	@Override
	/**
	 * 修改
	 */
	public void update(User user) {
	userDao.update(user);
	}
	/**
	 * 通过id查询
	 */
	public User findById (Integer user_id){
		return userDao.findById(user_id);
	}
      /**
       * 查询所有用户的方法
       */
    public List<User> findAll(){
    	return userDao.findAll();
    }
	@Override 
	/**
	 * 删除
	 */
	public void delete(User user) {
		userDao.delete(user);
	}
	
	/**
	 * 注册账号的方法
	 */
	@Override
	public User zhuce(User user) {
		 User zhuceuser = userDao.findByZhuCe(user);
			return zhuceuser;
	}
	/**
	 * 模糊查询的方法
	 */
	@Override
	public List<User> mohucha(User user) {
		
		return userDao.findBymohuAndPassword(user);
	}
	@Override
	public User fasong(User user) {
		
		User fasonguser = userDao.findByFaSong(user);
		return fasonguser;
	}
	

	

}
