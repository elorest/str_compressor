# Crystal String Compressor

Makes it easy to compress/decompress and string for sending over a network and multiple other uses.

## Installation

Add the following to your shards.yml 
```yml
dependencies:
  str_compressor:
    github: elorest/str_compressor 
```
Run `shards update`

## Usage

```cr
require "str_compressor"

# To use gzip
gzipped_str = Gzip.write("Hello World")
Gzip.read(gzipped_str) # => "Hello World"

# To use flate
flatecompressed_str = Flate.write("Hello World")
Flate.read(flatecompressed_str) # => "Hello World"
```

## Contributing

1. Fork it ( https://github.com/elorest/str_compressor/fork )
2. Create your feature branch (git checkout -b my-new-feature)
3. Commit your changes (git commit -am 'Add some feature')
4. Push to the branch (git push origin my-new-feature)
5. Create a new Pull Request

## Contributors

- [elorest](https://github.com/elorest) Isaac Sloan - creator, maintainer
