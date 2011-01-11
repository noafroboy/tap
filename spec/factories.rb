require 'faker'


Factory.define :user do |f|
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name
  f.first_name { first_name }
  f.last_name { last_name }
  f.email     { first_name + "." + last_name + "@" + "test.com" }
  f.password { "PASSWORD" }
  f.password_confirmation { "PASSWORD" }
  f.gender { "male" }
  f.opt_in_directory { true }
end