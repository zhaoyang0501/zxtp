package com.pzy.action.index;

import java.awt.geom.Area;
import java.util.List;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.beans.factory.annotation.Autowired;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.pzy.entity.Category;
import com.pzy.entity.Choose;
import com.pzy.entity.News;
import com.pzy.entity.User;
import com.pzy.entity.VoteResult;
import com.pzy.service.CategoryService;
import com.pzy.service.ChooseService;
import com.pzy.service.NewsService;
import com.pzy.service.UserService;
/***
 * 前台
 * @author 263608237@qq.com
 *
 */
@SuppressWarnings("serial")
@ParentPackage("struts-default")
@Namespace("/")
public class IndexAction extends ActionSupport {

	private User user;
	private String tip;
	private String key;
	
	private Long id;
	
	private List<Category> categorys;
	
	
	private List<Choose> chooses;
	
	private List<Area> areas;
	
	private List<VoteResult>  voteResults;
	private Choose choose;
	
	private News news;
	private List<News> newss;
	private Category category;
	private Integer  type;
	
	private Integer total;
	@Autowired
	private ChooseService chooseService;
	@Autowired
	private UserService userService;
	@Autowired
	private CategoryService categoryService;
	@Autowired
	private NewsService newsService;
	
	
	public List<Category> getCategorys() {
		return categorys;
	}
	public void setCategorys(List<Category> categorys) {
		this.categorys = categorys;
	}
	public String execute() throws Exception {
		return SUCCESS;
	}
	/***
	 * 首页
	 * @return
	 * @throws Exception
	 */
	@Action(value = "index", results = { @Result(name = "success", location = "/WEB-INF/views/index.jsp") })
	public String index() throws Exception {
		this.newss=this.newsService.findAll();
		return SUCCESS;
	}
	@Action(value = "myvote", results = { @Result(name = "success", location = "/WEB-INF/views/myvote.jsp") })
	public String myvote() throws Exception {
		User user=(User)ActionContext.getContext().getSession().get("user");
		if(user==null){
			this.tip="没有登录";
			return LOGIN; 
		}
		chooses=this.chooseService.findByUser(user);
		return SUCCESS;
	}
	
	/***
	 * 个人信息
	 * @return
	 * @throws Exception
	 */
	@Action(value = "center", results = { @Result(name = "success", location = "/WEB-INF/views/center.jsp") })
	public String center() throws Exception {
		return SUCCESS;
	}
	
	/***
	 * 投票
	 * @return
	 * @throws Exception
	 */
	@Action(value = "vote", results = { @Result(name = "success", location = "/WEB-INF/views/vote.jsp") })
	public String voto() throws Exception {
		this.categorys=this.categoryService.findAll();
		return SUCCESS;
	}
	/***
	 * 投票查看
	 * @return
	 * @throws Exception
	 */
	@Action(value = "viewvote", results = { @Result(name = "success", location = "/WEB-INF/views/viewvote.jsp") })
	public String viewvote() throws Exception {
		this.category=this.categoryService.find(id);
		return SUCCESS;
	}
	
	

	/***
	 * 高考周报
	 * @return
	 * @throws Exception
	 */
	@Action(value = "news",  results = { @Result(name = "success", location = "/WEB-INF/views/news.jsp") })
	public String news() throws Exception {
		this.newss=this.newsService.findAll();
		return SUCCESS;
	}
	/***
	 * 周报查询
	 * @return
	 * @throws Exception
	 */
	@Action(value = "viewnews", results = { @Result(name = "success", location = "/WEB-INF/views/viewnews.jsp") })
	public String viewnews() throws Exception {
		news=newsService.find(news.getId());
		return SUCCESS;
	}
	
	@Action(value = "votesubmit", 	results = { @Result(name = "success" , location = "/WEB-INF/views/viewvoteresult.jsp") ,
												@Result(name = "login", location = "/WEB-INF/views/login.jsp") })
	public String votesubmit() throws Exception {
		
		User user=(User)ActionContext.getContext().getSession().get("user");
		if(user==null){
			this.tip="没有登录";
			return LOGIN; 
		}
		
		choose.setUser(user);
		this.chooseService.save(choose);
		voteResults= categoryService.findVoteResult(choose.getCategory().getId());
		 total=0;
		for(VoteResult voteResult:voteResults){
			total+= voteResult.getNum();
		}
		for(VoteResult voteResult:voteResults){
			voteResult.setNum(total==0?0:(100*voteResult.getNum())/total);
		}
		category=categoryService.find(choose.getCategory().getId());
		return SUCCESS;
	}
	
	
	/**注册*/
	@Action(value = "doregister", results = { @Result(name = "success", location = "/WEB-INF/views/login.jsp") })
	public String doregister() throws Exception {
		userService.save(user);
		this.tip="注册成功请登录！";
		return SUCCESS;
	}
	@Action(value = "register", results = { @Result(name = "success", location = "/WEB-INF/views/register.jsp") })
	public String register() throws Exception {
		return SUCCESS;
	}
	/***
	 * 登录逻辑 查找数据库比较用户名密码
	 * @return
	 * @throws Exception
	 */
	 @Action(value = "dologin", 
	    		results = { @Result(name = "success" ,type="redirect", location = "index") ,
	    					@Result(name = "login", location = "/WEB-INF/views/login.jsp") })  
	 public String dologin() throws Exception { 
	    	User loginuser=userService.login(user.getName(), user.getPassword());
	    	if(loginuser!=null){
	    		ActionContext.getContext().getSession().put("user",loginuser );
	            return SUCCESS; 
	    	}
	    	else{
	    		ActionContext.getContext().getSession().clear();
	    		this.tip="登陆失败 不存在此用户名或密码!";
	    		return LOGIN;
	    	}
	    	
	}
	 @Action(value = "loginout", 
	    		results = { @Result(name = "success" ,type="redirect", location = "index") ,
	    					@Result(name = "login", location = "/WEB-INF/views/login.jsp") })  
	 public String loginout() throws Exception { 
		 ActionContext.getContext().getSession().put("user",null );
		 ActionContext.getContext().getSession().clear();
	     this.tip="成功退出!";
	     return LOGIN;
	    	
	}
	
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
	
		this.user = user;
	}
	public String getTip() {
		return tip;
	}
	public void setTip(String tip) {
		this.tip = tip;
	}
	
	public Integer getType() {
		return type;
	}
	public void setType(Integer type) {
		this.type = type;
	}
	public String getKey() {
		return key;
	}
	public void setKey(String key) {
		this.key = key;
	}

	public Category getCategory() {
		return category;
	}
	public void setCategory(Category category) {
		this.category = category;
	}
	public News getNews() {
		return news;
	}
	public void setNews(News news) {
		this.news = news;
	}
	public List<News> getNewss() {
		return newss;
	}
	public void setNewss(List<News> newss) {
		this.newss = newss;
	}
	
	public List<Area> getAreas() {
		return areas;
	}
	public void setAreas(List<Area> areas) {
		this.areas = areas;
	}
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public Choose getChoose() {
		return choose;
	}
	public void setChoose(Choose choose) {
		this.choose = choose;
	}
	public List<VoteResult> getVoteResults() {
		return voteResults;
	}
	public void setVoteResults(List<VoteResult> voteResults) {
		this.voteResults = voteResults;
	}
	public Integer getTotal() {
		return total;
	}
	public void setTotal(Integer total) {
		this.total = total;
	}
	public List<Choose> getChooses() {
		return chooses;
	}
	public void setChooses(List<Choose> chooses) {
		this.chooses = chooses;
	}
}
