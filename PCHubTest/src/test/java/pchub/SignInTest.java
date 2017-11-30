package pchub;

import java.util.concurrent.TimeUnit;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.firefox.FirefoxDriver;
import org.testng.annotations.AfterTest;
import org.testng.annotations.BeforeTest;
import org.testng.annotations.DataProvider;
import org.testng.annotations.Test;
import pchub.utilities.Constants;
import pchub.utilities.ExcelReader;
import org.testng.Assert;

public class SignInTest {
	private WebDriver driver;
	private String expectedTitle = "PcHub";
	
	@BeforeTest
	public void beforeTest() {	
		String baseURL = Constants.baseURL;
		driver = new FirefoxDriver();
		driver.manage().timeouts().implicitlyWait(10, TimeUnit.SECONDS);
		driver.get(baseURL);
		driver.manage().window().maximize();
		WebElement signInButton = driver.findElement(By.cssSelector("a[href='/users/sign_in']"));
		signInButton.click();
	}
	
	@Test(dataProvider = "Authentication")
	public void signIn(String email, String password) {
		
		WebElement mail = driver.findElement(By.id("user_email"));
		mail.clear();
		mail.sendKeys(email);
		
		WebElement passwd = driver.findElement(By.id("user_password"));
		passwd.clear();
		passwd.sendKeys(password);
	
		//WebElement checkbox = driver.findElement(By.id("user_remember_me"));
		//checkbox.click();
		
		WebElement submit = driver.findElement(By.name("commit"));
		submit.click();
		
		String actualTitle = driver.getTitle();
		Assert.assertEquals(actualTitle, expectedTitle);
		Assert.assertTrue(driver.getPageSource().contains("Signed in successfully."));
	}
		
	@DataProvider(name="Authentication")
	public Object[][] signInDataProvider() throws Exception {
		
		Object[][] connect = ExcelReader.connect(Constants.pathToExcel, 
	    		Constants.loginDataSheetName);
	    Object[][] cellData = ExcelReader.read(connect);
		return cellData;
	}
	
	@AfterTest
	public void afterTest() {
		driver.quit();
	}
}