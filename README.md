# Colirby

Ruby wrapper for the 'Proyecto Colibrí' API: https://github.com/openkratio/proyecto-colibri 

I could't decide if to make an abastraction or just wrap the API, so I started
to do a simple wrapper and decided a more 'ruby-programmer-friendly' one was necessary.

### `Colirby::Client`

  * Exact wrapper of Colibri's API

### `Colirby::RubyClient`

  * Still pending
  * Abstraction to make it more programmer friendly
  * Uses Colirby::Client   

## Installation

As any other gem ;)

## Usage (`Colirby::Client`)

### Member handling

```ruby	
# Using the same parameters as in http://proyectocolibri.es/documentacion/#!/member/
Colirby::Client.member(parameters)
```

### Group handing

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## License

MIT License (see LICENSE.txt).