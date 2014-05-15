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
  When I successfully run `knife encrypt -c .chef/knife.rb '"foo"' '"3EnQL7IItwtknz5p7TVlTQ=="'`
  Then the stdout should be one of:
    |chef_version|encrypted_string                              |
    |0.10.10     |e4ibEHAinGltDjYNQPV4rw==\n                    |
    |10.32.2     |e4ibEHAinGltDjYNQPV4rw==\n                    |
    |11.12.4     |9ZgVemCtbgVxJO8gmP7y8oXDUaYAYxQzkI5acgHm4Kw=\n|

Scenario: Encrypting an Array
  Given a knife configuration with en encrypted data bag secret "my secret"
  When I successfully run `knife encrypt -c .chef/knife.rb '["foo", "bar"]' '"3EnQL7IItwtknz5p7TVlTQ=="'`
  Then the stdout should be one of:
    |chef_version|encrypted_string                              |
    |0.10.10     |7wrizj9MAjmSVWWq69DUql0hNHFv7Hp/1tnQ/NJuD08=\n|
    |10.32.2     |7wrizj9MAjmSVWWq69DUql0hNHFv7Hp/1tnQ/NJuD08=\n|
    |11.12.4     |9ZgVemCtbgVxJO8gmP7y8uGwkFOaRPd0s74enPmPLhg=\n|

Scenario: Encrypting a Hash
  Given a knife configuration with en encrypted data bag secret "my secret"
  When I successfully run `knife encrypt -c .chef/knife.rb '{"foo"=>{"bar"=>"baz"}}' '"3EnQL7IItwtknz5p7TVlTQ=="'`
  Then the stdout should be one of:
    |chef_version|encrypted_string                              |
    |0.10.10     |nsXFeAANrmnBNu+QPfOHZFB5szSRA+Ezu94fmrJnNhk=\n|
    |10.32.2     |nsXFeAANrmnBNu+QPfOHZFB5szSRA+Ezu94fmrJnNhk=\n|
    |11.12.4     |9ZgVemCtbgVxJO8gmP7y8qJWD5s+Mz808peVZbMfalYVzNylYukjQTf+h791\nOdSv\n|
