# Colirby

Ruby wrapper for the 'Proyecto Colibrí' API: https://github.com/openkratio/proyecto-colibri 

## Installation

Add this line to your application's Gemfile:

    gem 'colirby'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install colirby

## Usage

### Member handling

```ruby	
# Using the same parameters as in http://proyectocolibri.es/documentacion/#!/member/
Colirby::Client.member(parameters)
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
