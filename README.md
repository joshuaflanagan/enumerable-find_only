# Enumerable::Only


Adds the `#only` method to all `Enumerable` objects.

`#only` behaves like `first`, except that it raises if more than one item is
in the collection.

```
# no items in the collection:

[].only => nil


# exactly one item in the collection:

[:item].only => :item

# more than one items in the collection:

[:first, :second].only => raises TooManyItems
```


## Installation

Add this line to your application's Gemfile:

```ruby
gem 'enumerable-only'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install enumerable-only


## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
