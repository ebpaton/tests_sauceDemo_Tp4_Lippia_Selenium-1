package lippia.web.steps;
import com.crowdar.core.PageSteps;
import cucumber.api.PendingException;
import gherkin.ast.ScenarioOutline;
import io.cucumber.java.en.*;
import lippia.web.services.SauceAuthService;

public class SauceLoginSteps extends PageSteps {

    @Given("^El cliente esta en la pagina login de sauce$")
    public void home() {
        SauceAuthService.navegarWeb();
    }

    @When("^El cliente ingresa el usuario (.*)$")
    public void ingresaUsuario(String criteria) {
        SauceAuthService.enterUserCriteria(criteria);
    }

    @When("^El cliente ingresa la contraseña (.*)$")
    public void ingresaContraseña(String criteria) {
        SauceAuthService.enterPasswordCriteria(criteria);
    }

    @When("^El cliente hace click en el boton de login")
    public void ClickInLogin() {
        SauceAuthService.clickLoginButton();
    }

    @Then("^El cliente ve la pagina de productos")
    public void verifyPage(){
        SauceAuthService.verifyPage();
    }

    @Then("^El cliente ve el mensaje de error usuario bloqueado")
    public void verifyErrorUserBlock(){
        SauceAuthService.errorVerify();
    }

    @Then("El cliente ve el mensaje de error usuario o contraseña incorrecta")
    public void verifyErrorInvalidCredentials(){
        SauceAuthService.errorVerifyCredentials();
    }

    @When("Ingreso con el usuario {string} y el password {string}")
    public void ingresoConElUsuarioYElPassword(String user, String password) {
        SauceAuthService.enterUserCriteria(user);
        SauceAuthService.enterPasswordCriteria(password);
    }

    @And("Realizo click en el boton login")
    public void realizoClickEnElBotonLogin() {
        SauceAuthService.clickLoginButton();
    }
}
    