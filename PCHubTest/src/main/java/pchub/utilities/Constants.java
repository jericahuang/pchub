package pchub.utilities;

public class Constants {
	
	public static final String baseURL = "http://localhost:3000/";
	
	public static final String index = "file:///home/daisy/pchub/prototype/index.html";
	
	public static final String login = "file:///home/daisy/pchub/prototype/login.html";
	
	public static final String adminXpath = "/html/body/div/div/div[2]/div/div/div/div/div[2]/form/div[3]/label[1]";
	
	public static final String staffXpath = "/html/body/div/div/div[2]/div/div/div/div/div[2]/form/div[3]/label[2]";
			
	public static final String volXpath = "/html/body/div/div/div[2]/div/div/div/div/div[2]/form/div[3]/label[3]";
	
	public static final String signupSubmit = "/html/body/div/div/div[2]/div/div/div/div/div[2]/form/button";
	
	public static final String loginDataSheetName = "SignIn";
	
	public static final String signUpSheetName = "SignUp";
	
	public static final String pathToExcel = "src/main/java/pchub/utilities/ExcelSheet.xlsx";
	
	public static final String webapp = baseURL + "web_list.html";
	
	public static final String mobileapp = baseURL + "app_list.html";
	
	public static final String signIn = "http://localhost:3000/users/sign_in";
	
	/**
	 * The following are constants required for SignInPageTest.java
	 */
	
	public static final String expectedHomeURL = "http://localhost:3000/#home";
	
	public static final String expectedWebAppURL = "http://localhost:3000/#web-apps";
	
	public static final String expectedMobileAppURL = "http://localhost:3000/#mobile-apps";
	
	public static final String expectedNewUserURL = "http://localhost:3000/users/sign_up";
	
	public static final String signInPageSheetName = "SignInPage";
	
	/**
	 * The following are constants required for CommonDBTests.java
	 */
	
	public static final String dbFilePath = "sqlite_database_file_path";
	 
}