@rest
Feature: Testing the Get All Pets


mvn verify -Denv=preprod -Dit.test=eu.vptech.demo.runners.GetAllPetApi


Scenario: Check that response is 200 for Get All Pet data API with a valid id (9223372000001176576)
    Given I securely send requests to '${envProperties:petstore.api}'
    Given I send a 'GET' request to '/pet/9223372000001176576'
    Then the service response status must be '200'
    And I save element '$' in environment variable 'response'
    Then 'response' matches the following cases:
        | $.id | equal | 9223372000001176576 |
        | $.category.name | equal | string |
        | $.name | equal | doggie |
        | $.photoUrls.[0] | equal | string |
        | $.category.id | equal | 0 |
        | $.tags.[0].id| equal | 0 |
        | $.tags.[0].name | equal | string |
        | $.status | equal | available |

Scenario: Check that response is 404 for Get All Pet data API with a nonexistent id (0)
    Given I securely send requests to '${envProperties:petstore.api}'
    Given I send a 'GET' request to '/pet/0'
    Then the service response status must be '404'
    And I save element '$' in environment variable 'response'
    Then 'response' matches the following cases:
        | $.code | equal | 1 |
        | $.type | equal | error |
        | $.message | equal | Pet not found |

Scenario: Check that response is 400 for Get All Pet data API with a invalid id (string: test)
    Given I securely send requests to '${envProperties:petstore.api}'
    Given I send a 'GET' request to '/pet/test'
    Then the service response status must be '400'
    And I save element '$' in environment variable 'response'
    Then 'response' matches the following cases:
        | $.code | equal | 400 |

Scenario: Check that response is 400 for Get All Pet data API with a invalid id (float: 1.2)
    Given I securely send requests to '${envProperties:petstore.api}'
    Given I send a 'GET' request to '/pet/1.2'
    Then the service response status must be '400'
    And I save element '$' in environment variable 'response'
    Then 'response' matches the following cases:
        | $.code | equal | 400 |

Scenario: Check that response is 400 for Get All Pet data API with a invalid id (boolean: true)
    Given I securely send requests to '${envProperties:petstore.api}'
    Given I send a 'GET' request to '/pet/true'
    Then the service response status must be '400'
    And I save element '$' in environment variable 'response'
    Then 'response' matches the following cases:
        | $.code | equal | 400 |

Scenario: Check that response is 400 for Get All Pet data API with a invalid id (negative: -1)
    Given I securely send requests to '${envProperties:petstore.api}'
    Given I send a 'GET' request to '/pet/-1'
    Then the service response status must be '400'
    And I save element '$' in environment variable 'response'
    Then 'response' matches the following cases:
        | $.code | equal | 400 |

Scenario: Check that response is 400 for Get All Pet data API without id ()
    Given I securely send requests to '${envProperties:petstore.api}'
    Given I send a 'GET' request to '/pet/'
    Then the service response status must be '405'
    And I save element '$' in environment variable 'response'
    Then 'response' matches the following cases:
        | $.code | equal | 405 |

