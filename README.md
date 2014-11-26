# Bootswatch Sprockets

The gem provides the [Bootswatch][] themes to the sprockets assets packaging.
It is meant to be used in conjunction with [Bootstrap for Sass][]. This gem
does not depend on the rails framework. It can be used with any other framework
that uses sprockets, e.g. [Middleman][].


  [Middleman]: https://github.com/middleman/middleman
  [Bootswatch]: https://github.com/thomaspark/bootswatch
  [Bootstrap for Sass]: https://github.com/twbs/bootstrap-sass


## Installation

Add this line to your application's Gemfile:

```ruby
gem 'bootswatch-sprockets'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install bootswatch_sprockets


## Usage

This is an example how to use the [Slate](http://bootswatch.com/slate/)
template:

```sass
@import bootswatch/slate/variables.scss

@import bootstrap-sprockets
@import bootstrap

@import bootswatch/slate/bootswatch.scss
```

**Attention!** The `.sccs` extension must be present in the `@import` directive. 

See the notes below. 


## Internals 

This gem does nothing more than packaging all the [Bootswatch][] files into
`/assets/stylsheets/...`. These include also `less` files and anything else
that comes with [Bootswatch][]. The `@import` from `sass` chokes when it is not
restricted to `.scss` files.

## Building 

[Bootswatch][] is included as a git submodule! 


