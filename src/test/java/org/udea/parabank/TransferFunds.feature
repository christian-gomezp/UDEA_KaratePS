@parabank_transfers
Feature: Transfer funds in Parabank

  Background:
    * url baseUrl
    * header Accept = 'application/json'
    * def val_fromAccountId = '13122'
    * def val_toAccountId = '13344'
    * def fakerObj = new faker()
    * def val_amount = fakerObj.number().numberBetween(1, 200)
    * def val_fromAccountId_error = fakerObj.number().randomNumber(5, true)
    * def val_toAccountId_error = '11111'
    * def val_amount = fakerObj.number().numberBetween(1, 200)

  Scenario: Transfer Funds
    Given path 'transfer'
    And param fromAccountId = val_fromAccountId // Cuenta origen
    And param toAccountId = val_toAccountId // Cuenta destino
    And param amount = val_amount // Monto a transferir
    When method POST
    Then status 200
    And match response == "Successfully transferred $" + val_amount + " from account #" + val_fromAccountId + " to account #" + val_toAccountId

  Scenario: Transfer Funds - Not found account
    Given path 'transfer'
    And param fromAccountId = val_fromAccountId_error // Cuenta origen
    And param toAccountId = val_toAccountId_error // Cuenta destino
    And param amount = val_amount // Monto a transferir
    When method POST
    Then status 400
    And match response == "Could not find account number " + val_fromAccountId_error + " and/or " + val_toAccountId_error

