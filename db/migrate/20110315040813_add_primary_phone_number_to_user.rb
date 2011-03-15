class AddPrimaryPhoneNumberToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :primary_phone_number, :string
    remove_column :users, :cellphone_number
    remove_column :users, :homephone_number
    remove_column :users, :workphone_number
  end

  def self.down
    remove_column :users, :primary_phone_number
    add_column :users, :cellphone_number, :string
    add_column :users, :homephone_number, :string
    add_column :users, :workphone_number, :string
  end
end
