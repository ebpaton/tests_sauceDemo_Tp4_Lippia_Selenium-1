Feature: Autenticacion en la pagina de sauce


  @Smoke @loginCorrecto
  Scenario: Inicio de sesion exitoso con usuario estandar
    Given El cliente esta en la pagina login de sauce
    When El cliente ingresa el usuario standard_user
    And El cliente ingresa la contraseña secret_sauce
    And El cliente hace click en el boton de login
    Then El cliente ve la pagina de productos


  @Error @Smoke @loginBloqueado
  Scenario: Intento de sesion con usuario bloqueado
    Given El cliente esta en la pagina login de sauce
    When El cliente ingresa el usuario locked_out_user
    And El cliente ingresa la contraseña secret_sauce
    And El cliente hace click en el boton de login
    Then El cliente ve el mensaje de error usuario bloqueado

  @Error @Smoke @loginUsuarioEquivocado
  Scenario: Intento de sesion con usuario incorrecto o contraseña incorrecta
    Given El cliente esta en la pagina login de sauce
    When El cliente ingresa el usuario dasdasddasdadads
    And El cliente ingresa la contraseña secret_saucedadsasda
    And El cliente hace click en el boton de login
    Then El cliente ve el mensaje de error usuario o contraseña incorrecta


