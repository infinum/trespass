ActiveRecord::Schema.define do
  self.verbose = false
  create_table :users, force: true do |t|
    t.string :name
    t.integer :age
    t.timestamps null: false
  end

  create_table :schema_migrations, force: true do |t|
    t.string :version
  end
end
