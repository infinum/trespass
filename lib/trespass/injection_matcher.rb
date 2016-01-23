require 'rspec'

ALWAYS_PRESENT_TABLE = :schema_migrations

RSpec::Matchers.define :be_sql_safe do
  match do |service|
    user_input = "1%'; DROP TABLE #{ALWAYS_PRESENT_TABLE}; SELECT * FROM users WHERE name = '"
    service.call(user_input)
    ActiveRecord::Base.connection.table_exists?('schema_migrations')
  end

  def supports_block_expectations?
    true
  end
end
