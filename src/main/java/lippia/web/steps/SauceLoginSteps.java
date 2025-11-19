package lippia.web.steps;
import com.crowdar.core.PageSteps;
import cucumber.api.PendingException;
import gherkin.ast.ScenarioOutline;
import io.cucumber.java.en.*;
import lippia.web.services.SauceAuthService;

public class SauceLoginSteps extends PageSteps {

    @Given("^El usuario esta en la página de Login de Saucedemo$")
    public void home() {
        SauceAuthService.navegarWeb();
    }

    @When("^El usuario introduce el nombre de usuario (.*)$")
    public void introduceUsuario(String criteria) {
        SauceAuthService.enterUserCriteria(criteria);
    }

    @When("^El usuario introduce la contraseña (.*)$")
    public void introduceContraseña(String criteria) {
        SauceAuthService.enterPasswordCriteria(criteria);
    }

    @When("^El usuario hace click en el boton de login")
    public void ClickInLogin() {
        SauceAuthService.clickLoginButton();
    }

    @Then("^El usuario avanza a la pagina de productos")
    public void verifyPage(){
        SauceAuthService.verifyPage();
    }

    @Then("El usuario ve el mensaje de error usuario o contraseña incorrecta")
    public void verifyErrorInvalidCredentials(){
        SauceAuthService.errorVerifyCredentials();
    }

    @When("Introduce el usuario {string} y el password {string}")
    public void introduceConElUsuarioYElPassword(String user, String password) {
        SauceAuthService.enterUserCriteria(user);
        SauceAuthService.enterPasswordCriteria(password);
    }

    @And("El usuario hace click en el boton de login")
    public void realizoClickEnElBotonLogin() {
        SauceAuthService.clickLoginButton();
    }
}
    