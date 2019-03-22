# Enumerable::FindOnly


Adds the `#find_only` method to all `Enumerable` objects.

`#find_only` behaves like `first`, except that it raises if more than one item is
in the collection.

```
# no items in the collection:

[].find_only => nil


# exactly one item in the collection:

[:item].find_only => :item

# more than one items in the collection:

[:first, :second].find_only => raises TooManyItems
```


## Installation

Add this line to your application's Gemfile:

```ruby
gem 'enumerable-find_only'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install enumerable-find_only


## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
