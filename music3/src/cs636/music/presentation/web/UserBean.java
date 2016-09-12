// This is the session bean (POJO) for the student-oriented web pages
// It is created at the studentWelcome page, and if the user happens
// on another page first, the user is forwarded to that page.
// This bean holds the room number for the user across the various
// page visits, making it (roomNo) a session variable.
package cs636.music.presentation.web;
import java.util.*;
import java.math.BigDecimal;
import cs636.music.domain.*;

import cs636.music.presentation.PresentationUtils;
import cs636.music.service.UserService;
import cs636.music.config.MusicSystemConfig;
import cs636.music.service.ServiceException;


public class UserBean {
	private UserService userService;
	private Cart cart = new Cart();;
	private int quantity=1;
	private String prodCode;
	private int prodID;
	private String command;
	private Product prod;
	private String email="";
	private String fname="";
	private String lname="";
	private User user;
	private Set<Product> ProductList = null;
	private Set<LineItem> CartList = null;
	private Track track;

	private String pcode;
	private int tid;
	private int trackNumber;
	private String title;
	private String sampleFilename;
		
	public UserBean() {
		userService = MusicSystemConfig.getUserService();
	}
	
	public void setSampleFilename(String em) {
		this.sampleFilename = em;
	}
	
	public String getSampleFilename() {
		return this.sampleFilename;
	}
	
	public void setTitle(String em) {
		this.title = em;
	}
	
	public String getTitle() {
		return this.title;
	}
	
	public void setTrackNumber(int x) {
		this.trackNumber = x;
	}
	
	public int getTrackNumber() {
		return this.trackNumber;
	}
	
	public void setPcode(String em) {
		this.pcode = em;
	}
	
	public String getPcode() {
		return this.pcode;
	}
	
	public void setTid(int x) throws ServiceException{
		this.tid = x;
	}
	
	public int getTid() {
		return this.tid;
	}
	
	
	public void addDownload() throws ServiceException{
		track = new Track();
		track.setSampleFilename(this.sampleFilename);
		track.setId(this.tid);
		prod = userService.getProduct(this.pcode);
		track.setProduct(prod);
		track.setTitle(this.title);
		user = userService.getUserInfo(this.email);
		userService.addDownload(user,track);
	}
	
	
	public void setProdID(int pid) {
		this.prodID = pid;
	}
	
	public int getProdID() {
		return this.prodID;
	}
	
	public void setFname(String em) {
		this.fname = em;
	}
	
	public String getFname() {
		return this.fname;
	}
	
	public void setLname(String em) {
		this.lname = em;
	}
	
	public String getLname() {
		return this.lname;
	}
	
	public void setEmail(String em) throws ServiceException{
		this.email = em;
		registerUser(this.fname,this.lname,this.email);
	}
	
	public String getEmail() {
		return this.email;
	}
	
	public void registerUser(String fn,String ln,String em) throws ServiceException{
	    userService.registerUser(this.fname, this.lname, this.email);
	}
	
	public void checkout()throws ServiceException{
		user=userService.getUserInfo(this.email);
		userService.checkout(cart,user);
	}
	
	public void cartclear() throws ServiceException{
		this.cart.clear();
	}
	
	public void setQuantity(int x) {
		this.quantity = this.quantity+x;
	}
	
	public int getQuantity() {
		return this.quantity;
	}
	
	public void setCommand(String com) {
		this.command = com;
	}
	
	public String getCommand(){
		return this.command;
	}
	
	public void setProdCode(String pcode) throws ServiceException{
		
		this.prodCode = pcode;
		prod=userService.getProduct(this.prodCode);
		if (getCommand().equalsIgnoreCase("add")){
		userService.addItemtoCart(prod,cart,1);
		}
		if (getCommand().equalsIgnoreCase("sub")){
		userService.addItemtoCart(prod,cart,-1);
		}
	}
	
	public String getProdCode(){	
		return this.prodCode;
	}
	
	public Product getProd(){	
		return this.prod;
	}
	
	public Set<Product> getProductList(){
		
		try {
			ProductList = userService.getProductList();
		} catch (ServiceException e) {
			System.out.println(MusicSystemConfig.exceptionReport(e));
		}
		return ProductList;
	}
	
	public Set<LineItem> getCartList(){
		try{
			CartList = cart.getItems();
			}catch (Exception e){
				System.out.println(e);
			}
		return CartList;
	}

}
