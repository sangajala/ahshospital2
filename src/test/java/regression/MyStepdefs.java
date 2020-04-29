package regression;

import com.devskiller.jfairy.Fairy;
import cucumber.api.PendingException;
import cucumber.api.Scenario;
import cucumber.api.java.After;
import cucumber.api.java.Before;
import cucumber.api.java.en.And;
import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import io.github.bonigarcia.wdm.WebDriverManager;

import org.junit.Assert;
import org.openqa.selenium.By;
import org.openqa.selenium.OutputType;
import org.openqa.selenium.TakesScreenshot;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.support.ui.Select;
import regression.pageObjects.CreateUserPage;
import regression.pageObjects.HomePage;
import regression.pageObjects.LoginPage;
import regression.pageObjects.UserListPage;

public class MyStepdefs extends TestRunner {

    public LoginPage loginPage;
    public HomePage homePage;
    public UserListPage userListPage;
    public CreateUserPage userPage;



    @Before
    public void start(){
        loginPage = new LoginPage();
        homePage = new HomePage();
        userListPage = new UserListPage();
        userPage = new CreateUserPage();
        driver.get("http://ahs.bananaapps.co.uk/");
    }

    @After
    public void stop(Scenario scenario){

        if(!scenario.isFailed()) {
            byte[] screenshotBytes = ((TakesScreenshot) driver).getScreenshotAs(OutputType.BYTES);
            scenario.embed(screenshotBytes, "image/png");
        }

        //else
        //is passed
        //remove
        //negation


    }



    @Given("^admin logged into the portals$")
    public void admin_logged_into_the_portals() throws Throwable {
        loginPage.login("07442382353","Superadmin");
    }




    @When("^he go to user module$")
    public void heGoToUserModule() {
        homePage.gotoUserListPage();
    }

    @And("^created a new user \"([^\"]*)\"$")
    public void createdANewUser(String user) throws Throwable {
        userListPage.gotoAddCreateUser();
        userPage.createUser(user);

    }

    @Then("^the user should be created successfully$")
    public void theUserShouldBeCreatedSuccessfully() {
        Assert.assertTrue(userPage.isUserCreated());
    }

    @Given("^user is in login page$")
    public void userIsInLoginPage() {
        Assert.assertTrue(driver.findElement(By.id("MobileNumber")).isDisplayed());
    }

    @When("^he login with username \"([^\"]*)\" and password \"([^\"]*)\"$")
    public void heLoginWithUsernameAndPassword(String username, String password) throws Throwable {
        loginPage.login(username,password);
    }

    @Then("^the login should be successful$")
    public void theLoginShouldBeSuccessful() {
        Assert.assertTrue( driver.findElement(By.linkText("MASTERS")).isDisplayed());
    }


    @Then("^the error message is shown \"([^\"]*)\"$")
    public void theErrorMessageIsShown(String message) throws Throwable {
        Assert.assertEquals(message,driver.findElement(By.cssSelector("div.col-md-6.alert.alert-danger")).getText().replace("\n","").replace("×","").trim());
    }
}
