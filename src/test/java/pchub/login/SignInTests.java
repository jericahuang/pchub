package pchub.login;

import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;
import org.testng.annotations.DataProvider;
import org.testng.annotations.Test;
import pchub.utilities.CommonCode1;
import pchub.utilities.Constants;
import pchub.utilities.ExcelReader;


public class SignInTests extends CommonCode1 {
	
	@Test(dataProvider = "Authentication")
	public void signIn(String email, String password, char user) {
		
		WebElement mail = driver.findElement(By.id("exampleInputEmail1"));
		mail.sendKeys(email);
		
		WebElement passwd = driver.findElement(By.id(""));
		passwd.sendKeys(password);
		
		switch (user) {
		case 'A': 	WebElement uservar = driver.findElement(By.xpath(Constants.adminXpath));
								uservar.click();
								break;
		
		case 'S': 		WebElement uservariable = driver.findElement(By.xpath(Constants.staffXpath));
								uservariable.click();
								break;
							
		case 'V': 	WebElement uservariab = driver.findElement(By.xpath(Constants.volXpath));
								uservariab.click();
								break;					
		default:				System.out.println("Not given");
		}
		
		WebElement submit = driver.findElement(By.xpath(Constants.signupSubmit));
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