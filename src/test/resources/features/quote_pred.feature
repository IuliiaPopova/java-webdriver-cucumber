@quote_pred
  Feature: Quote predefined
    @quote_pred1
    Scenario: Responsive UI
      Given I open url "http://skryabin.com/market/quote.html"
      Then I should see page title as "Get a Quote"
      When I resize window to 1024 and 1000
      Then element with xpath "//b[@id='location']" should be displayed
      And element with xpath "//b[@id='currentDate']" should be displayed
      And element with xpath "//b[@id='currentTime']" should be displayed
      When I resize window to 800 and 1000
      Then element with xpath "//b[@id='location']" should be displayed
      And element with xpath "//b[@id='currentDate']" should be displayed
      And element with xpath "//b[@id='currentTime']" should be displayed
      When I resize window to 600 and 1000
      Then element with xpath "//b[@id='location']" should not be displayed
      Then element with xpath "//b[@id='currentDate']" should not be displayed
      Then element with xpath "//b[@id='currentTime']" should not be displayed

    @quote_pred2
    Scenario: Username validation
      Given I open url "http://skryabin.com/market/quote.html"
      Then I should see page title as "Get a Quote"
      When I type "a" into element with xpath "//input[@name='username']"
      And I click on element with xpath "//input[@name='email']"
      Then element with xpath "//label[@id='username-error']" should contain text "2 characters"
      When I type "b" into element with xpath "//input[@name='username']"
      And I wait for 5 sec
      Then element with xpath "//label[@id='username-error']" should not be displayed

    @quote_pred3
    Scenario: Email validation
      Given I open url "http://skryabin.com/market/quote.html"
      Then I should see page title as "Get a Quote"
      When I type "test" into element with xpath "//input[@name='email']"
      And I click on element with xpath "//input[@id='password']"
      Then element with xpath "//label[@id='email-error']" should contain text "valid email"
      When I type "@gmail.com" into element with xpath "//input[@name='email']"
      And I wait for 5 sec
      Then element with xpath "//label[@id='email-error']" should not be displayed

    @quote_pred4
    Scenario: Password validation
      Given I open url "http://skryabin.com/market/quote.html"
      Then I should see page title as "Get a Quote"
      When I type "1" into element with xpath "//input[@id='password']"
      And I click on element with xpath "//input[@id='confirmPassword']"
      Then element with xpath "//label[@id='password-error']" should contain text "5 characters"
      When I type "2345" into element with xpath "//input[@id='password']"
      And I wait for 5 sec
      Then element with xpath "//label[@id='password-error']" should not be displayed

    @quote_pred5
    Scenario: Disabled Confirm Password
      Given I open url "http://skryabin.com/market/quote.html"
      Then I should see page title as "Get a Quote"
      When I clear element with xpath "//input[@id='password']"
      And I click on element with xpath "//input[@id='confirmPassword']"
      Then element with xpath "//input[@id='confirmPassword']" should be disabled
      When I type "1" into element with xpath "//input[@id='password']"
      Then element with xpath "//input[@id='confirmPassword']" should be enabled








