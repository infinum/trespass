# Trespass

[![Build Status](https://travis-ci.org/infinum/trespass.svg?branch=master)](https://travis-ci.org/infinum/trespass)
[![Code Climate](https://codeclimate.com/github/infinum/trespass/badges/gpa.svg)](https://codeclimate.com/github/infinum/trespass)

Test your custom SQL for potential security vulnerabilities in Rails apps.

```ruby
specify do
  expect { |user_input| UserSearch.new(user_input).call }.to be_sql_safe
end
```

Under development.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
