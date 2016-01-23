require 'spec_helper'

describe 'injection-matcher' do
  before do
    User.create(name: 'John', age: 29)
  end

  describe 'without injection' do
    let(:search_term) { 'John' }

    it 'it works' do
      expect(UserSearch.new(search_term).call.count).to eq(1)
    end
  end

  describe 'with injection' do
    let(:search_term) do
      "1%'; DROP TABLE schema_migrations; SELECT * FROM users WHERE name = '"
    end

    it 'it doesn\'t work' do
      UserSearch.new(search_term).call
      expect(ActiveRecord::Base.connection.table_exists?('schema_migrations')).not_to be
    end
  end

  specify do
    expect { |user_input| UserSearch.new(user_input).call }.not_to be_sql_safe
  end
end
