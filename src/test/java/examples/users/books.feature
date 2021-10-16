Feature: api automaation 

Background: define the url 
    Given url 'https://fakerestapi.azurewebsites.net'
    # * def timevalidator = read ('classpath:helpers/timevalidator.js')
Scenario: get list of all books 
    Given path '/api/v1/Books'
    When method Get 
    And status 200

Scenario: add a book 
    Given path '/api/v1/Books'
    And request 
    """
 {

 "id": 0,
  "title": "string",
  "description": "string",
  "pageCount": 0,
  "excerpt": "string",
  "publishDate": "2021-10-04T16:18:18.293Z"
 }
    """

    When method Post 
    And status 200
    And match response == '#object'


Scenario: pick a specific book 
    Given path '/api/v1/Books/9'
    When method Get 
    Then status 200 
    And match response.title == 'Book 9'
    And match response.pageCount == 900


Scenario: delete a book 
    Given path '/api/v1/Books/9'
    When method delete
    And status 200
    And match response != "#object"




