# Knife::Crypt

[![Build History][2]][1] [![Dependency Status][4]][3]

Commands for Chef's Knife Command to Encrypt and Decrypt Data

The `encrypt` and `decrypt` knife commands uses the configured data
bag secret to encrypt and decrypt data at the command line.

[1]: http://travis-ci.org/cgriego/knife-crypt
[2]: https://secure.travis-ci.org/cgriego/knife-crypt.png?branch=master
[3]: https://gemnasium.com/cgriego/knife-crypt
[4]: https://gemnasium.com/cgriego/knife-crypt.png

## Installation

This plugin is distributed as a Ruby Gem. To install it, run:

    $ gem install knife-crypt

## Usage

Encrypt a string

    $ knife encrypt foo

Encrypt an array

    $ knife encrypt foo

Encrypt a hash

    $ knife encrypt foo

Decrypt to a string

    $ knife decrypt foo

Decrypt to an array

    $ knife decrypt foo

Decrypt to a hash

    $ knife decrypt foo

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
