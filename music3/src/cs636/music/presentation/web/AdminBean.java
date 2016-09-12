package cs636.music.presentation.web;

import cs636.music.presentation.PresentationUtils;
import cs636.music.service.AdminService;
import cs636.music.service.UserService;
import cs636.music.config.MusicSystemConfig;
import cs636.music.service.ServiceException;

import java.util.List;
import java.util.Set;

import cs636.music.domain.*;

public class AdminBean {

	private AdminService adminService;
	private UserService userService;
	private Set<Invoice> listofInvoices;
	private Set<Download> listofDownloads;
	private int invoiceID=0;

	// get service object ref at start of session for current database
	public AdminBean() {
		adminService = MusicSystemConfig.getAdminService();
		userService = MusicSystemConfig.getUserService();
	}
	
	public void setInvoiceID (int id) throws ServiceException{
		this.invoiceID = id;
		adminService.processInvoice(this.invoiceID);
	}
	
	public int getInvoiceID(){
		return this.invoiceID;
	}
	
	//Mutators, called from scriptlets, to avoid using getters as mutators
	public String initDB() {
		String info = null;
		try {
			adminService.initializeDb();			
			info = "OK";
		} catch (ServiceException e) {
			info = "failed: " + MusicSystemConfig.exceptionReport(e);		}
		return info;
	}
	
	public boolean checklogin(String username, String password) throws ServiceException{
		return adminService.checkLogin(username,password);
	}
	
	
	public Set<Invoice> getListofInvoices() throws ServiceException{
		listofInvoices = adminService.getListofInvoices();
		return listofInvoices;
	}
	
	public Set<Download> getListofDownloads() throws ServiceException{
		listofDownloads = adminService.getListofDownloads();
		return listofDownloads;
	}
/*
	public String makeNextOrderReady() {
		String info = null;
		try {
			adminService.markNextOrderReady();
			info = "success";
		} catch (ServiceException e) {
			info = "failed: " + PizzaSystemConfig.exceptionReport(e);
		}
		return info;
	}

	public String advanceDay() {
		String info = null;
		try {
			adminService.advanceDay();
			info = "success";
		} catch (ServiceException e) {
			info = "failed: " + PizzaSystemConfig.exceptionReport(e);
		}
		return info;
	}


	public String changeSize() {
		String info = "";
		if (item != null) {
			// null command means textbox entry with <CR> submitted by browser 
			if (command == null || command.equalsIgnoreCase("add")) {
				info = addPizzaSize(item);  // item is name
			} else if (command.equalsIgnoreCase("remove")) {
				info = removeSize(item);  // item is id
			} else {
				info = "Failed because of bad request parameter: "+ command;
				System.out.println("changeTopping failed because of bad request parameter: "+ command);
			}
		}
		reset();
		return info;
	}

	public String changeTopping() {
		String info = "";
		if (item != null) {
			// null command means textbox entry with <CR> submitted by browser 
			if (command == null || command.equalsIgnoreCase("add")) {
				info = addTopping(item); // item is name
			} else if (command.equalsIgnoreCase("remove")) {
				info = removeTopping(item); // item is id
			} else {
				info = "Failed because of bad request parameter: "+ command;
				System.out.println("changeTopping failed because of bad request parameter: "+ command);
			}
		}
		reset();
		return info;
	}

	private String addPizzaSize(String sizeName) {
		String result;
		try {
			adminService.addPizzaSize(sizeName);
			result = "Success";
		} catch (ServiceException e) {
			result = "failed: " + PizzaSystemConfig.exceptionReport(e);
		}
		return result;
	}

	private String addTopping(String topping) {
		String result;
		try {
			adminService.addTopping(topping);
			result = "Success";
		} catch (ServiceException e) {
			result = "failed: " + PizzaSystemConfig.exceptionReport(e);
		}
		return result;
	}

	private String removeSize(String sizeId) {
		String result;
		try {
			// convert id to name for removeSize
			int id = Integer.parseInt(sizeId);
			Set<PizzaSize> allSizes = studentService.getPizzaSizes();	
			PizzaSize chosenSize = PresentationUtils.getSizeFromSizes(allSizes,
					id);			
			adminService.removeSize(chosenSize.getSizeName());
			result = "Success";
		} catch (ServiceException e) {
			result = "failed: " + PizzaSystemConfig.exceptionReport(e);
		}
		return result;
	}

	private String removeTopping(String toppingId) {
		String result;
		try {
			// convert id to name for removeTopping
			int id = Integer.parseInt(toppingId);
			Set<Topping> allToppings = studentService.getToppings();
			Topping chosenTopping = 
					PresentationUtils.getToppingFromToppings(allToppings, id);
			adminService.removeTopping(chosenTopping.getToppingName());
			result = "Success";
		} catch (ServiceException e) {
			result = "failed: " + PizzaSystemConfig.exceptionReport(e);
		}
		return result;
	}

	public void setItem(String item) {
		this.item = item;
	}

	public void setCommand(String command) {
		this.command = command;
	}
	// The next two methods are duplicated in StudentBean
	public Set<PizzaSize> getAllSizes() {
		Set<PizzaSize> allSizes = null;
		try {
			allSizes = studentService.getPizzaSizes();
		} catch (ServiceException e) {
			PizzaSystemConfig.exceptionReport(e);
		}
		return allSizes;
	}

	public Set<Topping> getAllToppings() {
		Set<Topping> allToppings = null;
		try {
			allToppings = studentService.getToppings();
		} catch (ServiceException e) {
			PizzaSystemConfig.exceptionReport(e);
		}
		return allToppings;
	}

	public 	List<PizzaOrder> getDailyReport()
	{
		try {
			return adminService.getDailyReport();
		} 
		catch (ServiceException e)
		{
			PizzaSystemConfig.exceptionReport(e);
			return null;
		}
	}
	public 	List<PizzaOrder> getAdminReport()
	{
		try {
			return adminService.getAdminReport();
		} catch (ServiceException e)
		{			
			return null;
		}
	}

	private void reset() {
		command = null;
		item = null;
	}
*/
}
