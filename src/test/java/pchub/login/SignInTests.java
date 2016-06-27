package pchub.login;

import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;
import org.testng.annotations.DataProvider;
import org.testng.annotations.Test;
import pchub.utilities.CommonCode;
import pchub.utilities.Constants;
import pchub.utilities.ExcelReader;


public class SignInTests extends CommonCode {
	
	@Test(dataProvider = "Authentication")
	public void signIn(String email, String password) {
		driver.findElement(By.cssSelector("a[href='/users/sign_in']")).click();
		
		
		WebElement mail = driver.findElement(By.id("user_email"));
		mail.sendKeys(email);
		
		WebElement passwd = driver.findElement(By.id("user_password"));
		passwd.sendKeys(password);
	/*	
		switch (user) {
		case "Administrator": 	WebElement uservar = driver.findElement(By.xpath(Constants.adminXpath));
								uservar.click();
								break;
		
		case "Staff": 	WebElement uservariable = driver.findElement(By.xpath(Constants.staffXpath));
								uservariable.click();
								break;
							
		case "Volunteer": 	WebElement uservariab = driver.findElement(By.xpath(Constants.volXpath));
								uservariab.click();
								break;					
		default:				System.out.println("Not given");
		}*/
		
		WebElement submit = driver.findElement(By.name("commit"));
		submit.click();
	}
	
	@DataProvider(name="Authentication")
	public Object[][] signInDataProvider() throws Exception {
		
		Object[][] connect = ExcelReader.connect(Constants.pathToExcel, 
	    		Constants.loginDataSheetName);
	    Object[][] cellData = ExcelReader.read(connect);
		return cellData;
	}
}