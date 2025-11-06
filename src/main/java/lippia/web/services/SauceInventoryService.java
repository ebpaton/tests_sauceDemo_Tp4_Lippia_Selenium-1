package lippia.web.services;
import com.crowdar.core.actions.ActionManager;
import lippia.web.constants.SauceConstants;
import org.testng.Assert;

public class SauceInventoryService extends ActionManager {


    public static void clickAddToCartButton() {
        click(SauceConstants.ADD_TO_CART_BUTTON_NAME);
    }

    public static void verifyAddToCart(){
        String cartContain = getText(SauceConstants.CART_CONTAIN);
        Assert.assertEquals(cartContain, "1", "no dice 1 el carrito");
    }

    public static void clickRemoveToCart(){
        click(SauceConstants.REMOVE_TO_CART_BUTTON_NAME);
    }

    public static void verifyRemoveToCart(){
        waitInvisibility(SauceConstants.CART_CONTAIN);
    }




}
