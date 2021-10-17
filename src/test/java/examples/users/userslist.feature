
Feature: test for lisitng users

Background:
* url 'https://reqres.in/'
  
  Scenario: get all users 
  Given path 'api/users?page=2'
  When method Get
  Then status 200

Scenario: new user 
    Given path 'api/users'
    And request
     """ 
        {
            "name": "morpheus",
            "job": "leader"
        }
 """
    When method post
    Then status 201
    Then match response == "#object"
    Then match response.job == "leader"

Scenario: delete user 
    Given path 'api/users'
    And request
     """ 
        {
            "name": "morpheus",
            "job": "leader"
        }
 """
    When method post
    Then status 201
    Then match response == "#object"
    Then match response.job == "leader"



Scenario: delete
    Given path 'api/users/2'
    When method delete
    Then status 204
    Then match response != "#object"


  