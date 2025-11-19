package lippia.web.steps;

import com.crowdar.core.PageSteps;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;
import lippia.web.services.SauceInventoryService;


public class SauceInventorySteps extends PageSteps {

    @Given("El contador de productos en el carrito tiene \"0\" productos")
    public void verify0ItemsInCart(){
        SauceInventoryService.verifyRemoveToCart();
    }

    @Given("El carrito tiene el producto \"Sauce Labs Bolt T-Shirt\"")
    public void verifyCartWhitSauceProduct(){
        SauceInventoryService.clickAddToCartButton();
    }

    @When("El cliente hace click en el boton \"Add to cart\" para el producto \"Sauce Labs Bolt T-Shirt\"")
    public void clickButtonAddToCart() {
        SauceInventoryService.clickAddToCartButton();
    }

    @Then("El contador de productos en el carrito tiene 1 producto")
    public void verifyAddToCart() {
        SauceInventoryService.verifyAddToCart();
    }


    @When("El cliente hace click en el boton \"remove\" del producto \"Sauce Labs Bolt T-Shirt\"")
    public void clickRemoveToCart() {
        SauceInventoryService.clickRemoveToCart();
    }




}
