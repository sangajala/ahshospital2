package regression.pageObjects;

import com.devskiller.jfairy.Fairy;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.How;
import org.openqa.selenium.support.ui.Select;
import regression.TestRunner;

public class CreateUserPage extends basePage  {


    @FindBy(how = How.ID, using = "UserName")
    WebElement username;

    @FindBy(how = How.ID, using = "MobileNumber")
    WebElement usersLink;

//    @FindBy(how =/* How.LINK_TEXT, using = "EmailID")
//    WebElement usersLink;
//
//
//    @FindBy(how = How.LINK_TEXT, using = "Users")
//    WebElement usersLink;
//
//
//    @FindBy(how = How.LINK_TEXT, using = "BranchID")
//    WebElement usersLink;
//
//    @FindBy(how = How.LINK_TEXT, using = "Users")
//    WebElement usersLink;*/



    public void createUser(String user){
        username.sendKeys("Test user");

        String email = Fairy.create().person().getEmail();
        driver.findElement(By.id("EmailID")).sendKeys(email);


        String mobile = Fairy.create().person().getTelephoneNumber();
        driver.findElement(By.id("MobileNumber")).sendKeys(mobile);

        driver.findElement(By.id("UserName")).sendKeys("testuser");
        driver.findElement(By.id("Password")).sendKeys("testuser");
        Select select = new Select(driver.findElement(By.id("UserType")));
        select.selectByVisibleText(user);
        Select select1 = new Select(driver.findElement(By.id("BranchID")));
        select1.selectByVisibleText("Visakhapatnam");
        driver.findElement(By.xpath("//button[text()='Submit']")).click();
    }

    public boolean isUserCreated(){
        return driver.findElement(By.xpath("//h1[text()='User Details']")).isDisplayed();
    }


}
