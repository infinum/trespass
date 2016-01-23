class UserSearch
  def initialize(search_term)
    @search_term = search_term
  end

  attr_reader :search_term

  def call
    ActiveRecord::Base.connection.execute(sql_query)
  end

  private

  def sql_query
    "SELECT id, name as slug FROM users WHERE name LIKE '#{search_term}'"
  end
end
