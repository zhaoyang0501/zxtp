package com.pzy.action.index;

import java.util.Date;
import java.util.List;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.beans.factory.annotation.Autowired;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.pzy.entity.Area;
import com.pzy.entity.Category;
import com.pzy.entity.HistoryMajor;
import com.pzy.entity.HistoryScore;
import com.pzy.entity.Myplan;
import com.pzy.entity.News;
import com.pzy.entity.Plan;
import com.pzy.entity.School;
import com.pzy.entity.ScoreLine;
import com.pzy.entity.User;
import com.pzy.service.AreaService;
import com.pzy.service.CategoryService;
import com.pzy.service.HistoryMajorService;
import com.pzy.service.HistoryScoreService;
import com.pzy.service.MyplanService;
import com.pzy.service.NewsService;
import com.pzy.service.PlanService;
import com.pzy.service.SchoolService;
import com.pzy.service.ScoreLineService;
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
	
	private Plan plan;
	
	private List<Plan> plans;
	private String tip;
	private String key;
	
	private Long id;
	private List<HistoryScore> historyScores;
	private School school;
	private List<School> schools;
	
	private List<Category> categorys;
	
	private List<HistoryMajor> historMajors;
	
	private List<Myplan> myplans;
	
	private List<Area> areas;
	
	private Myplan myplan;
	private News news;
	private List<News> newss;
	private Category category;
	private Integer  type;
	@Autowired
	private UserService userService;
	@Autowired
	private PlanService planService;
	@Autowired
	private HistoryScoreService historyScoreService;
	@Autowired
	private SchoolService schoolService;
	@Autowired
	private CategoryService categoryService;
	@Autowired
	private NewsService newsService;
	@Autowired
	private HistoryMajorService historyMajorService;
	@Autowired
	private MyplanService myplanService;
	@Autowired
	private AreaService areaService;
	@Autowired
	private ScoreLineService scoreLineService;
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
	 * 我的申请
	 * @return
	 * @throws Exception
	 */
	@Action(value = "apply", results = { @Result(name = "success", location = "/WEB-INF/views/apply.jsp") })
	public String apply() throws Exception {
		User user=(User)ActionContext.getContext().getSession().get("user");
		myplans=this.myplanService.findByUser(user);
		return SUCCESS;
	}
	/***
	 * 我的申请
	 * @return
	 * @throws Exception
	 */
	@Action(value = "plan", results = { @Result(name = "success", location = "/WEB-INF/views/plan.jsp") })
	public String plan() throws Exception {
		User user=(User)ActionContext.getContext().getSession().get("user");
		 plans=planService.findByUser(user);
		return SUCCESS;
	}
	/***
	 * 学校查询
	 * @return
	 * @throws Exception
	 */
	@Action(value = "school", results = { @Result(name = "success", location = "/WEB-INF/views/school.jsp") })
	public String school() throws Exception {
		schools=this.schoolService.findByName(key);
		return SUCCESS;
	}
	/***
	 * 学校详细
	 * @return
	 * @throws Exception
	 */
	@Action(value = "viewschool", results = { @Result(name = "success", location = "/WEB-INF/views/viewschool.jsp") })
	public String viewschool() throws Exception {
		school=schoolService.find(school.getId());
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
	/***
	 * 专业查询
	 * @return
	 * @throws Exception
	 */
	@Action(value = "category",  results = { @Result(name = "success", location = "/WEB-INF/views/category.jsp") })
	public String category() throws Exception {
		this.categorys=this.categoryService.findAll(key);
		return SUCCESS;
	}
	/***
	 * 专业详细
	 * @return
	 * @throws Exception
	 */
	@Action(value = "viewcategory", results = { @Result(name = "success", location = "/WEB-INF/views/viewcategory.jsp") })
	public String viewcategory() throws Exception {
		category=categoryService.find(category.getId());
		return SUCCESS;
	}
	/***
	 * 加入到我的自选
	 * @return
	 * @throws Exception
	 */
	@Action(value = "addmyplan", results = { @Result(name = "success" ,type="redirect", location = "apply") })
	public String addmyplan() throws Exception {
		User user=(User)ActionContext.getContext().getSession().get("user");
		myplan.setUser(user);
		myplan.setCreateDate(new Date(System.currentTimeMillis()));
		this.myplanService.save(myplan);
		return SUCCESS;
	}
	/**推荐学校*/
	@Action(value = "planschool", results = { @Result(name = "success", location = "/WEB-INF/views/planschool.jsp") })
	public String planschool() throws Exception {
		Plan newplan=planService.find(plan.getId());
		Integer orderBegain=newplan.getNum()-1000;
		Integer orderEnd=newplan.getNum()+1000;
		historyScores=historyScoreService.findAll(type, orderBegain, orderEnd);
		return SUCCESS;
	}
	/**推荐专业*/
	@Action(value = "plancategory", results = { @Result(name = "success", location = "/WEB-INF/views/plancategory.jsp") })
	public String plancategory() throws Exception {
		historMajors=historyMajorService.findBySchoolAndType(school,type,"2014");
		return SUCCESS;
	}
	/**报考建议*/
	@Action(value = "plansugest", results = { @Result(name = "success", location = "/WEB-INF/views/plansugest.jsp") })
	public String plansugest() throws Exception {
		User user=(User)ActionContext.getContext().getSession().get("user");
		Plan newplan=planService.find(plan.getId());
		this.plan=newplan;
		Area area=user.getArea();
		ScoreLine scoreline=scoreLineService.findByAreaAndYear(area, "2014");
		if(scoreline==null){
			tip="系统暂时未录入分数线，或者您所在地区不受支持";
			return SUCCESS;
		}
			
		if(newplan.getNum()<scoreline.getNum1()){
			type=1;
			return SUCCESS;
		}
			
		if(newplan.getNum()<scoreline.getNum2()){
			type=2;
			return SUCCESS;
		}
		if(newplan.getNum()<scoreline.getNum3()){
			type=3;
			return SUCCESS;
		}
		if(newplan.getNum()<scoreline.getNum4()){
			type=4;
			return SUCCESS;
		}
		return SUCCESS;
	}
	/**创建方案*/
	@Action(value = "createplan", results = { @Result(name = "success", location = "/WEB-INF/views/createplan.jsp") })
	public String createPlan() throws Exception {
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
		areas=areaService.findAll();
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
		 ActionContext.getContext().getSession().clear();
	     this.tip="成功退出!";
	     return LOGIN;
	    	
	}
	 /***
	  * 创建方案提交
	  * @return
	  * @throws Exception
	  */
	@Action(value = "docreateplan", results = { @Result(name = "success", location = "/WEB-INF/views/plan.jsp") })
	public String docreateplan() throws Exception {
		 User user=(User)ActionContext.getContext().getSession().get("user");
		 plan.setUser(user);
		 planService.save(plan);
		 plans=planService.findByUser(user);
		 this.tip="方案创建成功！";
		 return SUCCESS;
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
	public Plan getPlan() {
		return plan;
	}
	public void setPlan(Plan plan) {
		this.plan = plan;
	}
	public List<Plan> getPlans() {
		return plans;
	}
	public void setPlans(List<Plan> plans) {
		this.plans = plans;
	}
	public List<HistoryScore> getHistoryScores() {
		return historyScores;
	}
	public void setHistoryScores(List<HistoryScore> historyScores) {
		this.historyScores = historyScores;
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

	public School getSchool() {
		return school;
	}
	public void setSchool(School school) {
		this.school = school;
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
	public List<HistoryMajor> getHistorMajors() {
		return historMajors;
	}
	public void setHistorMajors(List<HistoryMajor> historMajors) {
		this.historMajors = historMajors;
	}
	public List<Myplan> getMyplans() {
		return myplans;
	}
	public void setMyplans(List<Myplan> myplans) {
		this.myplans = myplans;
	}
	public Myplan getMyplan() {
		return myplan;
	}
	public void setMyplan(Myplan myplan) {
		this.myplan = myplan;
	}
	public List<School> getSchools() {
		return schools;
	}
	public void setSchools(List<School> schools) {
		this.schools = schools;
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
}
