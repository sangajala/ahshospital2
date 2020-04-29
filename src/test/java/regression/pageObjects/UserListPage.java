package regression.pageObjects;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import regression.TestRunner;

public class UserListPage extends basePage{

    //

    public void gotoAddCreateUser(){
        driver.findElement(By.id("sample_editable_1_new")).click();
    }
}
