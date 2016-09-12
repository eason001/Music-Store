package cs636.music.config;

import java.sql.Connection;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;

import cs636.music.dao.AdminDAO;
import cs636.music.dao.DbDAO;
import cs636.music.dao.DownloadDAO;
import cs636.music.dao.InvoiceDAO;
import cs636.music.dao.ProductDAO;
import cs636.music.dao.UserDAO;
import cs636.music.service.AdminService;
import cs636.music.service.AdminServiceAPI;
import cs636.music.service.UserService;
import cs636.music.service.UserServiceAPI;

/**
 * @author Betty O'Neil, modified by Chung-Hsien Yu
 *
 * Configure the service objects, shut them down
 * 
 */

public class MusicSystemConfig {
	// could be externally specified--
	public static final String SOUND_BASE_URL = "http://www.cs.umb.edu/cs636/music1-setup/sound/";
	// the service objects in use, representing all lower layers to the app
	private static AdminService adminService;
	private static UserService userService;
	// the lower-level service objects-- 
	private static DownloadDAO downloadDao;
	// invoiceDao also persists its LineItems
	private static InvoiceDAO invoiceDao;
	private static ProductDAO productDao;
	private static UserDAO userDao;
	private static AdminDAO adminDao;
	
	private static EntityManagerFactory emf;

	static {
		try {
			System.out.println("Starting JPA initialization");
			configureServices();
		} catch (Exception e) {
			// in web app case, this will go in tomcat's log
			// (which is shown in the Console window in the
			// case that tomcat is run from eclipse)
			System.out.println("Exception in static initializer");
			System.out.println(exceptionReport(e));
		}
	}
	// set up service API, data access objects
	public static void configureServices()
		throws Exception {	
		try {
			// read persistence.xml, etc.
			emf = configureJPA(); 
			testEMF(emf); 
			System.out.println("calling dbDAO constructor");
			DbDAO dbDAO = new DbDAO(emf);
			// configure rest of service and DAO singleton objects--
			// These objects get what they need at creation-time
			// This is "constructor injection"
			productDao = new ProductDAO(dbDAO);
			userDao = new UserDAO(dbDAO);
			downloadDao = new DownloadDAO(dbDAO);		
			invoiceDao = new InvoiceDAO(dbDAO);
			adminDao= new AdminDAO(dbDAO);
			
			adminService = new AdminService(dbDAO,downloadDao, invoiceDao, adminDao);
			userService = new UserService(productDao,userDao,downloadDao,invoiceDao, dbDAO);
		} catch (Exception e) {
			System.out.println("Problem with contacting DB");
			System.out.println("Exception: " + exceptionReport(e));
		    // rethrow to notify caller (caller should print exception details)
			throw new RuntimeException("Exception in configureServices",e); 
		}
	}
	
	// The configuration information is read from the persistence.xml file
	// on the classpath.  This may throw a RuntimeException.
	// During this call, TransactionSessionCustomizer is used
	// to set serializable isolation level.
	public static EntityManagerFactory configureJPA() {
		EntityManagerFactory emf = Persistence.createEntityManagerFactory("music3");
		return emf;
	}
	
	// Try a test EM session and get the isolation level
	private static void testEMF(EntityManagerFactory emf)
	{
		System.out.println("starting testEMF");
		EntityManager em = emf.createEntityManager();
		System.out.println("testEMF: Got an EM");
		EntityTransaction tx = em.getTransaction();
		tx.begin();
		// dig down in software to get the actual JDBC Connection--
		try {
			System.out.println("testEM: Trying to get JDBC Connection from EM...");
			// This trick doesn't work for mysql, causes NullPointerException
			Connection conn = em.unwrap(Connection.class);
			System.out.println("JDBC isolation level (0=none,1=RU,2=RC,4=RR,8=SR) is " 
					+ conn.getTransactionIsolation());
			tx.commit();
			em.close();
		} catch (Exception e) {
			System.out.println(" Exception trying to get isolation level: " + e + "\n Continuing...");
		}
	}
	
	
	// Compose an exception report
	// and return the string for callers to use
	public static String exceptionReport(Exception e) {
		String message = e.toString(); // exception name + message
		if (e.getCause() != null) {
			message += "\n  cause: " + e.getCause().toString();
			if (e.getCause().getCause() != null)
				message += "\n    cause's cause: "
						+ e.getCause().getCause().toString();
		}
		return message;
	}
	
	// call this to free up system resources
	// allocated by configureJPA(). 
	public static void shutdownServices() {
		if (emf != null && !emf.isOpen())
			emf.close();
	}
	
	// Let the apps get the business logic layer services
	public static AdminService getAdminService() {
		return adminService;
	}

	public static UserService getUserService() {
		return userService;
	}
}
