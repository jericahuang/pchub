package pchub;

import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.ui.Select;
import org.testng.annotations.DataProvider;
import org.testng.annotations.Test;

import pchub.utilities.CommonCode;
import pchub.utilities.Constants;
import pchub.utilities.ExcelReader;

public class SignupTests extends CommonCode{

	@Test(dataProvider = "Signup")
		public void signupTests(String name, String nickName, String email, String emailconf,
				String password, String passconf, String city, String state, String country,
				String profile, String addInfo) {
		
		WebElement signUpButton = driver.findElement(By.cssSelector("a[href='/users/sign_up']"));
		signUpButton.click();
		
		WebElement aName = driver.findElement(By.id("user_name"));
		aName.sendKeys(name);
		
		WebElement nick = driver.findElement(By.id("user_nickname"));
		nick.sendKeys(nickName);
		
		WebElement mail = driver.findElement(By.id("user_email"));
		mail.sendKeys(email);
		
		WebElement mailconf = driver.findElement(By.id("user_email_confirmation"));
		mailconf.sendKeys(emailconf);
		
		WebElement passwd = driver.findElement(By.id("user_password"));
		passwd.sendKeys(password);
		
		WebElement passwdconf = driver.findElement(By.id("user_password_confirmation"));
		passwdconf.sendKeys(passconf);
		
		WebElement aCity = driver.findElement(By.id("user_city"));
		aCity.sendKeys(city);
		
		WebElement aState = driver.findElement(By.id("user_state_or_province"));
		aState.sendKeys(state);
		
		Select aCountry = new Select(driver.findElement(By.id("user_country")));
		aCountry.selectByVisibleText(country);
		
		WebElement aProfile = driver.findElement(By.id("user_profile_link"));
		aProfile.sendKeys(profile);
		
		WebElement moreInfo = driver.findElement(By.id("user_additional_information"));
		moreInfo.sendKeys(addInfo);
		
		WebElement save = driver.findElement(By.name("commit"));
		save.click();
	}
	
	@DataProvider(name="Signup")
	public Object[][] signInDataProvider() throws Exception {
		
		Object[][] connect = ExcelReader.connect(Constants.pathToExcel, 
	    		Constants.signUpSheetName);
	    Object[][] cellData = ExcelReader.read(connect);
		return cellData;
	}
}
