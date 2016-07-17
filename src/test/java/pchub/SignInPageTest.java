package pchub;

import java.util.concurrent.TimeUnit;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.firefox.FirefoxDriver;
import org.testng.Assert;
import org.testng.annotations.AfterMethod;
import org.testng.annotations.BeforeMethod;
import org.testng.annotations.DataProvider;
import org.testng.annotations.Test;
import pchub.utilities.Constants;
import pchub.utilities.ExcelReader;

public class SignInPageTest {
	
	private String signup; 
	private WebDriver driver;
	private String actualURL;
	
	@BeforeMethod
	public void beforeTest() {
		signup = Constants.signIn;
		driver = new FirefoxDriver();
		driver.manage().timeouts().implicitlyWait(10, TimeUnit.SECONDS);
		driver.get(signup);
		driver.manage().window().maximize();
	}
	
	@Test(priority = 1)
	public void homePageLink() {
		WebElement webAppButton = driver.findElement(By.cssSelector("a[href='#home']"));
		webAppButton.click();
		actualURL = driver.getCurrentUrl();
		Assert.assertEquals(Constants.expectedHomeURL, actualURL);
	}
	
	@Test(priority = 2)
	public void webAppsLink() {
		WebElement webAppButton = driver.findElement(By.cssSelector("a[href='#web-apps']"));
		webAppButton.click();
		actualURL = driver.getCurrentUrl();
		Assert.assertEquals(Constants.expectedWebAppURL, actualURL);
	}

	@Test(priority = 3)
	public void mobileAppsLink() {
		WebElement mobileAppButton = driver.findElement(By.cssSelector("a[href='#mobile-apps']"));
		mobileAppButton.click();
		actualURL = driver.getCurrentUrl();
		Assert.assertEquals(Constants.expectedMobileAppURL, actualURL);			
	}
	
	@Test(dataProvider = "resetPassword")
	public void forgotPassword(String email) {
		WebElement forgotPassword = driver.findElement(By.cssSelector("a[href='/users/password/new']"));
		forgotPassword.click();
		WebElement mail = driver.findElement(By.id("user_email"));
		mail.sendKeys(email);
		WebElement submit = driver.findElement(By.name("commit"));
		submit.click();
		
		Assert.assertTrue(driver.getPageSource().contains(
				"You will receive an email with instructions on "
				+ "how to reset your password in a few minutes."));
		//TODO automate testing of received mails
	}
	
	@Test(priority = 5)
	public void createAccount() {
		WebElement createAccount = driver.findElement(By.cssSelector("a[href='/users/sign_up.user']"));
		createAccount.click();
		actualURL = driver.getCurrentUrl();
		Assert.assertEquals(Constants.expectedHomeURL, actualURL);			
	}
	
	@DataProvider(name = "resetPassword")
	public Object[][] signInPageTestDataProvider() throws Exception {
		
		Object[][] connect = ExcelReader.connect(Constants.pathToExcel, 
	    		Constants.signInPageSheetName);
	    Object[][] cellData = ExcelReader.read(connect);
		return cellData;
		
	}
	
	@AfterMethod
	public void afterTest() {
		driver.quit();
	}
}
