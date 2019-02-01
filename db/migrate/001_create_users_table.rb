class CreateUsersTable < ActiveRecord::Migration[5.2]
  def self.up
    create_table :users do |t|
      t.string :username
      t.string :phone
      t.string :email
      t.string :full_name
      t.index :username, unique: true
      t.index :phone, unique: true
    end
  end

  def self.down
    drop_table :users
  end
end
