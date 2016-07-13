package pchub;

import java.util.concurrent.TimeUnit;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.firefox.FirefoxDriver;
import org.openqa.selenium.support.ui.Select;
import org.testng.Assert;
import org.testng.annotations.AfterTest;
import org.testng.annotations.BeforeTest;
import org.testng.annotations.DataProvider;
import org.testng.annotations.Test;
import pchub.utilities.Constants;
import pchub.utilities.ExcelReader;

public class SignupTest {
	
	private WebDriver driver;
	String expectedTitle = "PcHub";
	
	@BeforeTest
	public void beforeTest() {	
		String baseURL = Constants.baseURL;
		driver = new FirefoxDriver();
		driver.manage().timeouts().implicitlyWait(10, TimeUnit.SECONDS);
		driver.get(baseURL);
		driver.manage().window().maximize();
		WebElement signUpButton = driver.findElement(By.cssSelector("a[href='/users/sign_up']"));
		signUpButton.click();
	}

	@Test(dataProvider = "Signup")
	public void signupTests(String name, String nickName, String email, String emailconf,
			String password, String passconf, String city, String state, String country,
			String profile, String addInfo) {
		
		WebElement aName = driver.findElement(By.id("user_name"));
		aName.clear();
		aName.sendKeys(name);
			
		WebElement nick = driver.findElement(By.id("user_nickname"));
		nick.clear();
		nick.sendKeys(nickName);
			
		WebElement mail = driver.findElement(By.id("user_email"));
		mail.clear();
		mail.sendKeys(email);
			
		WebElement mailconf = driver.findElement(By.id("user_email_confirmation"));
		mailconf.clear();
		mailconf.sendKeys(emailconf);
			
		WebElement passwd = driver.findElement(By.id("user_password"));
		passwd.clear();
		passwd.sendKeys(password);
			
		WebElement passwdconf = driver.findElement(By.id("user_password_confirmation"));
		passwdconf.clear();
		passwdconf.sendKeys(passconf);
			
		WebElement aCity = driver.findElement(By.id("user_city"));
		aCity.clear();
		aCity.sendKeys(city);
			
		WebElement aState = driver.findElement(By.id("user_state_or_province"));
		aState.clear();
		aState.sendKeys(state);
			
		Select aCountry = new Select(driver.findElement(By.id("user_country")));
		aCountry.selectByVisibleText(country);
			
		WebElement aProfile = driver.findElement(By.id("user_profile_link"));
		aProfile.clear();
		aProfile.sendKeys(profile);
			
		WebElement moreInfo = driver.findElement(By.id("user_additional_information"));
		moreInfo.clear();
		moreInfo.sendKeys(addInfo);
		
		WebElement save = driver.findElement(By.name("commit"));
		save.click();
		
		String actualTitle = driver.getTitle();
		Assert.assertEquals(actualTitle, expectedTitle);
		Assert.assertTrue(driver.getPageSource().contains
				("Welcome! You have signed up successfully."));
	}
	
	@DataProvider(name="Signup")
	public Object[][] signInDataProvider() throws Exception {
		
		Object[][] connect = ExcelReader.connect(Constants.pathToExcel, 
	    		Constants.signUpSheetName);
	    Object[][] cellData = ExcelReader.read(connect);
		return cellData;
	}
	
	@AfterTest
	public void afterTest() {
		driver.quit();
	}
}
