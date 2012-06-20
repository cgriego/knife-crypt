Feature: knife encrypt
  In order to efficiently work with encrypted values
  As a knife user
  I want to encrypt values

Scenario: Command List
  When I run `knife`
  Then the output should contain:
    """
    knife encrypt DATA (options)
    """

Scenario: Usage
  When I run `knife encrypt`
  Then the output should contain:
    """
    USAGE: knife encrypt DATA (options)
    """
  And the output should contain:
    """
    FATAL: You must specify data to encrypt
    """
  And the exit status should not be 0

Scenario: Encrypting a String
  Given a knife configuration with en encrypted data bag secret "my secret"
  When I successfully run `knife encrypt '"foo"'`
  Then the stdout should contain exactly:
    """
    e4ibEHAinGltDjYNQPV4rw==

    """

Scenario: Encrypting an Array
  Given a knife configuration with en encrypted data bag secret "my secret"
  When I successfully run `knife encrypt '["foo", "bar"]'`
  Then the stdout should contain exactly:
    """
    7wrizj9MAjmSVWWq69DUql0hNHFv7Hp/1tnQ/NJuD08=

    """

Scenario: Encrypting a Hash
  Given a knife configuration with en encrypted data bag secret "my secret"
  When I successfully run `knife encrypt '{"foo"=>{"bar"=>"baz"}}'`
  Then the stdout should contain exactly:
    """
    nsXFeAANrmnBNu+QPfOHZFB5szSRA+Ezu94fmrJnNhk=

    """
