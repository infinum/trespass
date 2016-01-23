# Trespass

Test your custom SQL for potential security vulnerabilities in Rails apps. Under development.

```ruby
specify do
  expect { |user_input| UserSearch.new(user_input).call }.not_to be_sql_safe
end
```

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'trespass'
```

And then execute:

    $ bundle

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
