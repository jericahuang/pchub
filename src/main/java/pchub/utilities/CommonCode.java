package pchub.utilities;

import java.util.concurrent.TimeUnit;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.firefox.FirefoxDriver;
import org.testng.annotations.AfterTest;
import org.testng.annotations.BeforeTest;

public class CommonCode {
	
	protected WebDriver driver;
	protected static String baseURL; 

	@BeforeTest
	public void beforeTest() {	
		String baseURL = Constants.baseURL;
		driver = new FirefoxDriver();
		driver.manage().timeouts().implicitlyWait(10, TimeUnit.SECONDS);
		driver.get(baseURL);
		driver.manage().window().maximize();
	}
	
	@AfterTest
	public void afterTest() {
		driver.close();
	}
}