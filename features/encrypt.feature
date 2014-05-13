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
  When I successfully run `knife encrypt -VV -c .chef/knife.rb '"foo"' '"3EnQL7IItwtknz5p7TVlTQ=="'`
  Then the stdout should contain exactly:
    """
    9ZgVemCtbgVxJO8gmP7y8oXDUaYAYxQzkI5acgHm4Kw=

    """

Scenario: Encrypting an Array
  Given a knife configuration with en encrypted data bag secret "my secret"
  When I successfully run `knife encrypt -c .chef/knife.rb '["foo", "bar"]' '"3EnQL7IItwtknz5p7TVlTQ=="'`
  Then the stdout should contain exactly:
    """
    9ZgVemCtbgVxJO8gmP7y8uGwkFOaRPd0s74enPmPLhg=

    """

Scenario: Encrypting a Hash
  Given a knife configuration with en encrypted data bag secret "my secret"
  When I successfully run `knife encrypt -c .chef/knife.rb '{"foo"=>{"bar"=>"baz"}}' '"3EnQL7IItwtknz5p7TVlTQ=="'`
  Then the stdout should contain exactly:
    """
    9ZgVemCtbgVxJO8gmP7y8qJWD5s+Mz808peVZbMfalYVzNylYukjQTf+h791\nOdSv

    """
