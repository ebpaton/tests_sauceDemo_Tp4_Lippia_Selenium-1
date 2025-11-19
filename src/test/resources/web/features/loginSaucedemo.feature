Feature: Autenticacion en la pagina de sauce


#  @Error @Smoke @loginUsuarioIncorrecto
#    Given El usuario esta en la pagina login de Saucedemo
#    When   usuario introduce el nombre de usuario crowdar
#    And El usuario introduce la contraseña secret_crowdar
#    A  el usuario presiona el botón de Login
#    Then El usuario ve el mensaje de error usuario o contraseña incorrecta




  @Smoke
  Scenario Outline: Autenticación de varios Usuarios
    Given El usuario esta en la página de Login de Saucedemo
    When El usuario introduce el nombre de usuario "<user>" y el password "<password>"
    And El usuario presiona el botón de Login
    Then El usuario esta en la página de Products


    Examples:
      | user                    | password     |
      | standard_user           | secret_sauce |
      | problem_user            | secret_sauce |
      | error_user              | secret_sauce |
      | performance_glitch_user | secret_sauce |
      | visual_user             | secret_sauce |

