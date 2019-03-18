package org.bigjava.domain;

import java.util.List;

public class Page {
       private int page;//当前页
       private int zPage;//总条数
       public final int Tiao = 5;//每页显示
       private List<User> user;//
       private int zYe;//总页数
       int start; //开始索引
	   private int satrt;
	private List<User> list;
       
       public Page() {
    	   
       }
       public Page(int page,int zPage) {
    	   this.page = page;
    	   this.zPage = zPage;
    	   if(this.page<=0) this.page=1;
    	   this.zYe = (this.zPage % Tiao ==0)?(this.zPage / Tiao):(this.zPage / Tiao+1);
    	   if(this.page>this.zYe)this.page=this.zPage;
    	   this.satrt=this.page*Tiao-(Tiao-1)-1;
       }
       public int getPage() {
   		return page;
   	}

   	public void setPage(int page) {
   		this.page = page;
   	}

   	public int getZPage() {
   		return zPage;
   	}

   	public void setZPage(int zPage) {
   		this.zPage = zPage;
   	}

   	public List<User> getList() {
   		return list;
   	}

   	public void setList(List<User> list) {
   		this.list = list;
   	}

   	public int getZYe() {
   		return zYe;
   	}

   	public void setZYe(int zYe) {  //总页数
   		this.zYe = zYe;
   	
   	}

   	public int getStart() {
   		return start;
   	}

   	public void setStart(int start) {
   		this.start = start;
   	}
   	
   	

   }


