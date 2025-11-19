Feature: Compra con el Carrito de Compras

  Background: Login Exitoso
    Given El usuario esta en la pagina login de Saucedemo
    When El usuario introduce el nombre de usuario standard_user
    And El usuario introduce la contraseña secret_sauce
    And El usuario hace click en el boton de login
    Then El usuario avanza a la pagina de productos

  @Smoke @IncrementaProductoEnElCarrito
  Scenario: Agregar un producto y verificar el contador
    Given El contador de productos en el carrito tiene "0" productos
    When El usuario hace click en el boton "Add to cart" para el producto "Sauce Labs Bolt T-Shirt"
    Then El usuario de productos en el carrito tiene 1 producto

  @Smoke @DecrementaProductoDelCarrito
  Scenario: Eliminarr un producto y verificar el contador
    Given El carrito tiene el producto "Sauce Labs Bolt T-Shirt"
    When El cliente hace click en el boton "Remove" del producto "Sauce Labs Bolt T-Shirt"
    Then El contador de productos en el carrito tiene "0" productos