Feature: `cp' command

  Scenario: Copies the given translation
    Given I have a valid project on localeapp.com with api key "MYAPIKEY" and the translation key "foo.bar"
    And an initializer file
    When I successfully run `localeapp cp foo.bar foo.baz`
    Then the output should contain:
    """
    Localeapp cp

    Copying key: foo.bar to foo.baz
    Success!
    """

  Scenario: Reports an error when the given API key is incorrect
    Given no project exist on localeapp.com with API key "MYAPIKEY"
    When I run `localeapp -k MYAPIKEY cp foo.bar foo.baz`
    Then the exit status must be 70
    And the output must match /error.+404/i
