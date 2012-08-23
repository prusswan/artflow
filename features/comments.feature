Feature: Comments
  In order to guide work on a creation
  As a user
  I want to read and add creation comments

  Background:
    Given I am designer "Lindsay Bluth" with an account
    And a creation
    And I sign in

  Scenario: Designer sees form when comments empty
    When I go to the creation's page
    Then there should be 0 comments
    Then the comment form should be visible

  @javascript
  Scenario: Designer adds comment
    When I go to the creation's page
    Then there should be 0 comments
    When I enter a comment and submit it
    Then there should be 1 comment
