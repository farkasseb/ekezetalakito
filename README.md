# Ekezetalakito

This is a simple gem used to convert acute Hungarian accents to utf-8 accented characters. I've created it to practice building a Ruby gem. Its whole functionaly can be substituted with [`unicode_normalize`](http://ruby-doc.org/stdlib-2.2.0/libdoc/unicode_normalize/rdoc/String.html#method-i-unicode_normalize) function from Ruby 2.2.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'ekezetalakito'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install ekezetalakito

## Usage

Currently there are two way you can use this gem.

First you can call the `convert` method by giving a convertable text to it.

Second you can put some text to the Clipboard with accute accents and then (after having successfully installed the gem) running `ekezetalakito` in the command line. This will convert the Clipboard's content.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/farkasseb/ekezetalakito.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
