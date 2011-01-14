class AddTapFieldsToUser < ActiveRecord::Migration
  def self.up                                
    add_column :users, :first_name, :string
    add_column :users, :middle_name, :string
    add_column :users, :last_name, :string
    add_column :users, :gender, :string
    add_column :users, :age_group, :string
    add_column :users, :cellphone_number, :string
    add_column :users, :homephone_number, :string
    add_column :users, :workphone_number, :string
    add_column :users, :street_address, :string
    add_column :users, :city, :string
    add_column :users, :state, :string
    add_column :users, :zip_code, :integer
    add_column :users, :undergrad_school, :string
    add_column :users, :undergrad_major, :string 
    add_column :users, :graduate_school, :string 
    add_column :users, :graduate_major, :string  
    add_column :users, :other_degrees, :string  
    add_column :users, :industry_field, :string  
    add_column :users, :company_name, :string  
    add_column :users, :title_position_function, :string  
    add_column :users, :years_experience, :string  
    add_column :users, :areas_of_interest, :string  
    add_column :users, :other_community_organizations, :string
    add_column :users, :potential_mentee, :boolean
    add_column :users, :potential_mentor, :boolean  
    add_column :users, :help_at_workshops_panels, :boolean  
    add_column :users, :opt_in_directory, :boolean
    add_column :users, :is_admin, :boolean, :default => false
  end

  def self.down
    remove_column :users, :first_name
    remove_column :users, :middle_name
    remove_column :users, :last_name
    remove_column :users, :gender
    remove_column :users, :age_group
    remove_column :users, :cellphone_number
    remove_column :users, :homephone_number
    remove_column :users, :workphone_number
    remove_column :users, :street_address
    remove_column :users, :city
    remove_column :users, :state
    remove_column :users, :zip_code
    remove_column :users, :undergrad_school
    remove_column :users, :undergrad_major
    remove_column :users, :graduate_school
    remove_column :users, :graduate_major
    remove_column :users, :other_degrees
    remove_column :users, :industry_field
    remove_column :users, :company_name
    remove_column :users, :title_position_function
    remove_column :users, :years_experience
    remove_column :users, :areas_of_interest
    remove_column :users, :other_community_organizations
    remove_column :users, :potential_mentee
    remove_column :users, :potential_mentor
    remove_column :users, :help_at_workshops_panels
    remove_column :users, :opt_in_directory
    remove_column :users, :is_admin
  end
end
