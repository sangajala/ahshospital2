package regression.pageObjects;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import regression.TestRunner;

public class LoginPage extends basePage {

    public void login(String username,String password) {
        driver.findElement(By.id("MobileNumber")).sendKeys(username);
        driver.findElement(By.id("Password")).sendKeys(password);
        driver.findElement(By.className("chic-button")).click();
    }
}
