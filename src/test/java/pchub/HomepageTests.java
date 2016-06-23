package pchub;

import org.testng.annotations.Test;
import java.util.List;
import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;
import pchub.utilities.CommonCode;

public class HomepageTests extends CommonCode{		
	    
	@Test
	public void AllLinksTest() throws InterruptedException {
		
		List<WebElement> links = driver.findElements(By.tagName("a")); 
		 String[] all_links = new String [links.size()];
		for(int i = 0; i < links.size(); i++) {
			all_links[i] = links.get(i).getAttribute("href");
		}
		
		for(int i = 0; i < links.size(); i++){
			driver.navigate().to(all_links[i]);
			Thread.sleep(2000);
		}
		
		//((JavascriptExecutor) driver).executeScript(
			//	"window.scrollTo(0, document.body.scrollHeight)");
		//TODO: Implement scroll down after test fails and click on links
	}
		
}	