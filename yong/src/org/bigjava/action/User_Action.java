package org.bigjava.action;

import org.bigjava.domain.PageBean;
import org.bigjava.domain.User;
import org.bigjava.service.User_Service;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

/**
 * 员工管理的Action类
 * @author zy
 *
 */
public class User_Action extends ActionSupport implements ModelDriven<User> {
	public String account;
	public String password;
	
    public String getAccount() {
		return account;
	}
	public void setAccount(String account) {
		this.account = account;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	//模型驱动使用的对象
    private User user = new User();
    @Override
	public User getModel() {
		
		return user;
	}
    //接受当前页数
  	private Integer currPage = 1;
  		
    public void setCurrPage(Integer currPage) {
  			this.currPage = currPage;
  	}
    //登录的方法
    public String login() {
    	System.out.println("login方法执行了");
    	User existuser = userService.login(user);
    	if(existuser == null) {
    		this.addActionError("用户名或密码错误");
    		return ERROR;
    	}else {
    		ActionContext.getContext().getSession().put("existuser", existuser);	
    		return SUCCESS;
    	}
    	
    }
	//注入业务层的类
    private User_Service userService;
       
	public void setUserService(User_Service userService) {
		this.userService = userService;
	}
	//查询
	public String findAll(){
		PageBean<User> pageBEan = userService.findByPage(currPage);
		//将pagebean存入到值栈中
		ActionContext.getContext().getValueStack().push(pageBEan);
		return "findAll";
	}
	//跳转添加页面的方法
	public String saveUI(){
		return "saveUI";
	}
	//添加
   public String save(){
	   System.out.println("save方法执行了");
	   User saveuser = userService.save(user);
	   if(saveuser !=null ) {
		   this.addActionError("该账号已被注册");
		   return "saveUI";
	   }
		return "saveSuccess"; 
   }
   //编辑的执行方法
   public String edit(){
	   user = userService.findById(user.getUser_id());
	return "editSuccess";
	   
   }
   //修改的方法
   public String update(){
     userService.update(user);
     return "updateSuccess";
    }
   //个人修改执行方法
   public String edit_geren(){
	   user = userService.findById(user.getUser_id());
	return "edit_gerenSuccess";
	   
   }
 //个人修改的方法
   public String update_geren(){
     userService.update(user);
     return "update_gerenSuccess";
    }
   //删除
   public String delete(){
	   user =userService.findById(user.getUser_id());
	   userService.delete(user);
	   return "deleteSuccess";
   }
 //跳转忘记密码页面的方法
 	public String xiuUI(){
 		return "xiuUI";
 	}
   //忘记密码修改
   public String xiu() {
	   System.out.println("xiu方法执行了");
	User xiuuser = userService.xiu(user);
   	if(xiuuser  == null) {
   		this.addActionError("身份信息不匹配");
   		return "xiuUI";
   	}else {
   		ActionContext.getContext().getSession().put("xiuuser", xiuuser);
   		
   		return "xiuSuccess";
   	} 
   }
   //跳转注册页面的方法
   public String  zhuUI() {
	   return "zhuUI";
   }
   //注册账号
  public String zhuce() {
	  System.out.println("zhuce方法执行了");
	   User zhuceuser = userService.zhuce(user);
	   if(zhuceuser !=null ) {
		   this.addActionError("该账号已被注册");
		   return "zhuUI";
	   }
	   return "error";
   }
  //个人修改密码
  public String xiupass() {
	  user = userService.findById(user.getUser_id());
	  return "xiupass";
  }
   
}
