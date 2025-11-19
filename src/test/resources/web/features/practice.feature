@login
Feature: Autenticación de Usuario

  Background:
    Given El cliente esta en la página de Login de Saucedemo

  Scenario Outline: Autenticación de Usuarios - Caso <Tipo>
    When El cliente introduce el nombre de usuario <Usuario> y la contraseña <Contraseña>
    And El cliente presiona el botón de Login
    Then El cliente esta en la página de Products

    Examples:
      | Tipo_Caso              | Usuario         | Contraseña     | Resultado_Esperado                                                  |
      | Login Exitoso          | standard_user   | secret_sauce   | Página de Productos                                                 |
      | Usuario Bloqueado      | locked_out_user | secret_sauce   | Mensaje de Error: Epic sadface: Sorry, this user has been locked out. |
      | Credenciales Inválidas | error_user      | 123456         | Mensaje de Error: Epic sadface: Username and password do not match any user in this service. |
      | Usuario Vacío          |                 | secret_sauce   | Mensaje de Error: Epic sadface: Username is required                |

  @carrito
  Feature: Compra con el Carrito de Compras

  Background:
    Given El cliente ha iniciado sesión con el user "standard_user" de forma exitosamente en la página de Login de Saucedemo

  Scenario: Agregar y Eliminar un Producto desde la Página de Productos
    When El cliente presiona en el boton "Add to cart" y se añade el producto "Sauce Labs Backpack" al carrito de compras
    Then el ícono del carrito debería mostrar el número "1"
    When El cliente hace click en el boton "Remove" y el producto se elimino añade el producto "Sauce Labs Backpack" al carrito de compras
    Then el ícono del carrito debería mostrar "vacío" o el número "0"

  Scenario: Validar el Contador del Carrito al agregar múltiples Productos
    When El cliente presiona agrega los siguientes producto al carrito:
      | producto                                  |
      | Sauce Labs Backpack                       |
      | Sauce Labs Bolt T-Shirt                   |
      | Sauce Labs Fleece Jacket                  |
    Then el ícono del carrito debería mostrar "3"


  @compra
  Feature: Proceso de Compra Completa (Checkout)

  Background:
    Given El cliente ha iniciado sesión con el user "standard_user" de forma exitosamente en la página de Login de Saucedemo
    And el usuario ha agregado los siguientes productos al carrito:
      | producto                  |
      | Sauce Labs Backpack       |
      | Sauce Labs Bolt T-Shirt   |

  Scenario: Compra Completa con Validación de Datos y Finalización
    When El cliente esta en la página del carrito
    And presiona el botón de Checkout
    And introduce el Fisrt Name de "Juan", Last Name de "Perez" y Código Postal "12345"
    And presiono el botón "Continue"

# Validación que usa una Data Table para verificar múltiples productos y precios
    Then El cliente debería ver la página de "Overview"
    And El cliente valida que el detalle del pedido contenga los siguientes productos y precios:
      | producto                  | precio   |
      | Sauce Labs Backpack       | $29.99   |
      | Sauce Labs Bolt T-Shirt   | $15.99   |

    When El cliente presiona el botón "Finish"
    Then El cliente debería ver la página de confirmación con el mensaje "Thank you for your order!"
