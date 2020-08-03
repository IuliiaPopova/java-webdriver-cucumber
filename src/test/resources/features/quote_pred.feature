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

    @quote_pred6
    Scenario: Confirm Password validation
      Given I open url "http://skryabin.com/market/quote.html"
      Then I should see page title as "Get a Quote"
      When I type "12345" into element with xpath "//input[@id='password']"
      And I type "123" into element with xpath "//input[@id='confirmPassword']"
      And I click on element with xpath "//input[@name='phone']"
      Then element with xpath "//label[@id='confirmPassword-error']" should contain text "5 characters"

    @quote_pred7
    Scenario: Date of Birth calendar
      Given I open url "http://skryabin.com/market/quote.html"
      Then I should see page title as "Get a Quote"
      When I click on element with xpath "//input[@id='dateOfBirth']"
      And I click on element with xpath "//select[@data-handler='selectMonth']/option[@value='3']"
      And I click on element with xpath "//select[@data-handler='selectYear']/option[@value='2007']"
      And I click on element with xpath "//a[text()='7']"
      And I wait for 4 sec

    @quote_pred8
    Scenario: Pop-up
      Given I open url "http://skryabin.com/market/quote.html"
      Then I should see page title as "Get a Quote"
      When I click on element with xpath "//button[@id='thirdPartyButton']"
      And I accept alert

    @quote_pred9
    Scenario: Dismiss Pop-up alert
      Given I open url "http://skryabin.com/market/quote.html"
      Then I should see page title as "Get a Quote"
      When I click on element with xpath "//button[@id='thirdPartyButton']"
      And I dismiss alert

    @quote_pred10
    Scenario: New window
      Given I open url "http://skryabin.com/market/quote.html"
      Then I should see page title as "Get a Quote"
      When I click on element with xpath "//button[contains(text(),'Related')]"
      And I switch to new window
      Then element with xpath "//h4" should contain text "Documents List:"
      And I switch to first window

    @quote_pred11
    Scenario: Iframe
      Given I open url "http://skryabin.com/market/quote.html"
      Then I should see page title as "Get a Quote"
      When I switch to iframe with xpath "//iframe[@name='additionalInfo']"
      And I type "Yulia" into element with xpath "//input[@id='contactPersonName']"
      And I type "1234567890" into element with xpath "//input[@id='contactPersonPhone']"
      And I switch to default content

    @quote_pred12
    Scenario: Submit form with required fields
      Given I open url "http://skryabin.com/market/quote.html"
      Then I should see page title as "Get a Quote"
      When I click on element with xpath "//input[@id='name']"
      Then element with xpath "//div[@aria-describedby='nameDialog']" should be displayed
      When I type "Yulia" into element with xpath "//input[@id='firstName']"
      And I type "Popova" into element with xpath "//input[@id='lastName']"
      And I click on element with xpath "//span[contains(text(),'Save')]"
      Then element with xpath "//input[@id='name']" should have attribute "value" as "Yulia Popova"
      When I type "tester" into element with xpath "//input[@name='username']"
      And I type "test@gmail.com" into element with xpath "//input[@name='email']"
      And I type "12345" into element with xpath "//input[@id='password']"
      And I type "12345" into element with xpath "//input[@id='confirmPassword']"
      And I click on element with xpath "//input[@name='agreedToPrivacyPolicy']"
      And I click on element with xpath "//button[@id='formSubmit']"
      Then element with xpath "//b[@name='password']" should contain text "[entered]"
      And element with xpath "//b[@name='username']" should contain text "tester"
      And element with xpath "//b[@name='email']" should contain text "test@gmail.com"
      And element with xpath "//b[@name='agreedToPrivacyPolicy']" should contain text "true"

    @quote_pred13
    Scenario: Submit form with required fields and optional fields fields
      Given I open url "http://skryabin.com/market/quote.html"
      Then I should see page title as "Get a Quote"
      When I click on element with xpath "//input[@id='name']"
      Then element with xpath "//div[@aria-describedby='nameDialog']" should be displayed
      When I type "Yulia" into element with xpath "//input[@id='firstName']"
      And I type "Popova" into element with xpath "//input[@id='lastName']"
      And I click on element with xpath "//span[contains(text(),'Save')]"
      Then element with xpath "//input[@id='name']" should have attribute "value" as "Yulia Popova"
      When I type "tester" into element with xpath "//input[@name='username']"
      And I type "test@gmail.com" into element with xpath "//input[@name='email']"
      And I type "12345" into element with xpath "//input[@id='password']"
      And I type "12345" into element with xpath "//input[@id='confirmPassword']"
      And I type "4158883131" into element with xpath "//input[@name='phone']"
      When I click on element with xpath "//input[@id='dateOfBirth']"
      And I click on element with xpath "//select[@data-handler='selectMonth']/option[@value='11']"
      And I click on element with xpath "//select[@data-handler='selectYear']/option[@value='1995']"
      And I click on element with xpath "//a[text()='5']"
      When I click on element with xpath "//select[@name='countryOfOrigin']/option[@value='Japan']"
      And I click on element with xpath "//*[@value='female']"
      And I click on element with xpath "//input[@name='allowedToContact']"
      When I switch to iframe with xpath "//iframe[@name='additionalInfo']"
      And I type "Yulia" into element with xpath "//input[@id='contactPersonName']"
      And I type "4158883131" into element with xpath "//input[@id='contactPersonPhone']"
      And I switch to default content
      When I click on element with xpath "//option[contains(text(),'Toyota')]"
      And I type "12 Fulton street, San Francisco" into element with xpath "//textarea[@id='address']"
      And I click on element with xpath "//input[@name='agreedToPrivacyPolicy']"
      And I click on element with xpath "//button[@id='formSubmit']"
      Then element with xpath "//b[@name='password']" should contain text "[entered]"
      And element with xpath "//b[@name='username']" should contain text "tester"
      And element with xpath "//b[@name='email']" should contain text "test@gmail.com"
      And element with xpath "//b[@name='agreedToPrivacyPolicy']" should contain text "true"
      And element with xpath "//b[@name='countryOfOrigin']" should contain text "Japan"
      And element with xpath "//b[@name='phone']" should contain text "4158883131"
      And element with xpath "//b[@name='address']" should contain text "12 Fulton street, San Francisco"
      And element with xpath "//b[@name='gender']" should contain text "female"
      And element with xpath "//b[@name='carMake']" should contain text "Toyota"
      And element with xpath "//b[@name='contactPersonName']" should contain text "Yulia"
      And element with xpath "//b[@name='contactPersonPhone']" should contain text "4158883131"












      








