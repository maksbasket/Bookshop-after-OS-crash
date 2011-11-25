Feature: Manage products
  In order to use depot
  As an user
  I want to create and manage products and orders

  Scenario: Buy a product
    Given I have not orders
    And depot have 4 products
    And depot have Check, Credit card, Purchase order payment types
    When I go to the store page
    Then I see 4 entries
    When I add the product to cart
    Then Cart shows
    When I checkout the Cart
    Then I see Order's form
    When I create an Order
    Then I receive email from depot@example.com

  Scenario: Manage orders
    Given I am admin
    And I have 3 orders
    When I go to the orders page
    Then I see 3 orders
    When I click show link
    And I click shipped button
    Then buyer receive an email from depot@example.com

  Scenario: Failure messages
    Given depot have 3 products
    When I try to see /products/4
    Then admin receive email from depot@example.com
    Given I have 3 orders
    When I try to see /orders/4
    Then admin receive email from depot@example.com
    