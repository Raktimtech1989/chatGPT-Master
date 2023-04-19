package KubernetesChatGPT.ChatGPT;

import java.net.URL;

import org.openqa.selenium.By;
import org.openqa.selenium.Platform;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.remote.DesiredCapabilities;
import org.openqa.selenium.remote.RemoteWebDriver;
import org.testng.annotations.AfterTest;
import org.testng.annotations.BeforeTest;
import org.testng.annotations.Test;

public class AmazonTest {
	
	private WebDriver driver;

    @BeforeTest
    public void setUp() throws Exception {
        DesiredCapabilities capabilities = DesiredCapabilities.chrome();
        capabilities.setCapability("version", "latest");
        capabilities.setCapability("platform", Platform.LINUX);
        driver = new RemoteWebDriver(new URL("http://localhost:4444/wd/hub"), capabilities);
    }

    @Test
    public void testAmazonHomePage() throws Exception {
        driver.get("https://www.amazon.com/");
        WebElement searchBox = driver.findElement(By.id("twotabsearchtextbox"));
        searchBox.sendKeys("laptop");
        searchBox.submit();
        Thread.sleep(5000); // wait for the results to load
    }

    @AfterTest
    public void tearDown() throws Exception {
        driver.quit();
    }


}
