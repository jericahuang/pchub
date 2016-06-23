package pchub.utilities;

import java.util.concurrent.TimeUnit;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.firefox.FirefoxDriver;
import org.testng.annotations.AfterTest;
import org.testng.annotations.BeforeTest;

public class CommonCode1 {
	
	protected WebDriver driver;
	//protected static String login;
	
	@BeforeTest
	public void beforeTest() {
		//String login = Constants.login;
		//driver = new FirefoxDriver();
		//driver.get(login);
		
		String login = Constants.login;
		driver = new FirefoxDriver();
		driver.manage().timeouts().implicitlyWait(10, TimeUnit.SECONDS);
		driver.get(login);
		driver.manage().window().maximize();
		
	}
	
	@AfterTest
	public void afterTest() {
		driver.close();
	}
	

}
