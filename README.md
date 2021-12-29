# Crazyton

Sometimes I wanted to create something richer than a module with `module_function`, but without the `def self.` syntax of class methods.

I therefore created `Crazyton`. Under the hood it uses `method_missing` with `Singleton` to provide its functionality, which is sort of crazy, hence the name.

One of the advantages of using classes over modules is that you can use inheritance.

Since `Crazyton` uses a `Singleton` under the hood, you can manage state on the class without having to resort to class variables. Which is also better practice.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'crazyton'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install crazyton

## Usage

Create a class and include the `Crazyton` module in order for its instance methods to be exposed as class methods:

```ruby
class Dog
    include Crazyton

    def bark
        puts 'woof'
    end
end

Dog.bark
=> woof
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/abuisman/crazyton.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
