package lippia.web.services;
import com.crowdar.core.PropertyManager;
import com.crowdar.core.actions.ActionManager;
import lippia.web.constants.SauceConstants;
import org.testng.Assert;

import static com.crowdar.core.actions.WebActionManager.navigateTo;

public class SauceAuthService extends ActionManager {

    public static void navegarWeb(){
        navigateTo(PropertyManager.getProperty("web.base.url"));
    }

    public static void enterUserCriteria(String text) {
        setInput(SauceConstants.INPUT_USER_LOGIN_XPATH, text);
    }

    public static void enterPasswordCriteria(String text) {
        setInput(SauceConstants.INPUT_PASSWORD_LOGIN_XPATH, text);
    }

    public static void clickLoginButton() {
        click(SauceConstants.LOGIN_BUTTON_NAME);
    }

    public static void verifyPage() {
        String title = getText(SauceConstants.PRODUCTS_TITLE_CLASS);
        Assert.assertEquals(title, "Products", "La verificación del título de la página falló después del login.");
    }

    public static void errorVerify() {
        String errorMessage = getText(SauceConstants.ERROR_MESSAGE);
        Assert.assertEquals(errorMessage, "Epic sadface: Sorry, this user has been locked out.", "El mensaje de error no se mostro, o se mostro otro mensaje");
    }

    public static void errorVerifyCredentials() {
        String errorMessage = getText(SauceConstants.ERROR_MESSAGE);
        Assert.assertEquals(errorMessage, "Epic sadface: Username and password do not match any user in this service", "El mensaje de error no se mostro, o se mostro otro mensaje");
    }



}
