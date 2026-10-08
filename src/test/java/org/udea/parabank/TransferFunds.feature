@parabank_transfers
Feature: Transfer funds in Parabank

  Background:
    * url baseUrl
    * header Accept = 'application/json'
    * def val_fromAccountId = '13122'
    * def val_toAccountId = '13344'
    * def fakerObj = new faker()
    * def val_amount = fakerObj.number().numberBetween(1, 200)

  Scenario: Transfer Funds
    Given path 'transfer'
    And param fromAccountId = val_fromAccountId // Cuenta origen
    And param toAccountId = val_toAccountId // Cuenta destino
    And param amount = val_amount // Monto a transferir
    When method POST
    Then status 200
    And match response == "Successfully transferred $" + val_amount + " from account #" + val_fromAccountId + " to account #" + val_toAccountId
