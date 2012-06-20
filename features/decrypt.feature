Feature: knife decrypt
  In order to efficiently work with encrypted values
  As a knife user
  I want to decrypt encrypted values

Scenario: Command List
  When I run `knife`
  Then the output should contain:
    """
    knife decrypt DATA (options)
    """

Scenario: Usage
  When I run `knife decrypt`
  Then the output should contain:
    """
    USAGE: knife decrypt DATA (options)
    """
  And the output should contain:
    """
    FATAL: You must specify data to decrypt
    """
  And the exit status should not be 0

Scenario: Decrypting a String
  Given a knife configuration with en encrypted data bag secret "my secret"
  When I successfully run `knife decrypt e4ibEHAinGltDjYNQPV4rw==`
  Then the stdout should contain exactly:
    """
    "foo"

    """

Scenario: Decrypting an Array
  Given a knife configuration with en encrypted data bag secret "my secret"
  When I successfully run `knife decrypt 7wrizj9MAjmSVWWq69DUql0hNHFv7Hp/1tnQ/NJuD08=`
  Then the stdout should contain exactly:
    """
    ["foo", "bar"]

    """

Scenario: Decrypting a Hash
  Given a knife configuration with en encrypted data bag secret "my secret"
  When I successfully run `knife decrypt nsXFeAANrmnBNu+QPfOHZFB5szSRA+Ezu94fmrJnNhk=`
  Then the stdout should contain exactly:
    """
    {"foo"=>{"bar"=>"baz"}}

    """
