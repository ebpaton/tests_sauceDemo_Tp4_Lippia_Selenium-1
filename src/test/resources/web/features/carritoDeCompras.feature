Feature: Carrito de Compras

  Background: Login Exitoso
    Given El cliente esta en la pagina login de sauce
    When El cliente ingresa el usuario standard_user
    And El cliente ingresa la contraseña secret_sauce
    And El cliente hace click en el boton de login
    Then El cliente ve la pagina de productos

  @Smoke @AgregaProductoEnElCarrito
  Scenario: Agregar un producto y verificar el contador
    Given El contador de productos en el carrito tiene "0" productos
    When El cliente hace click en el boton "Add to cart" para el producto "Sauce Labs Backpack"
    Then El contador de productos en el carrito tiene 1 producto

  @Smoke @QuitarProductoDelCarrito
  Scenario: Quitar un producto y verificar el contador
    Given El carrito tiene el producto "Sauce Labs Backpack"
    When El cliente hace click en el boton "remove" del producto "Sauce Labs Backpack"
    Then El contador de productos en el carrito tiene "0" productos