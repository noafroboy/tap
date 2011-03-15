class User < ActiveRecord::Base
  acts_as_authentic do |c|
    c.login_field = 'email'
  end
  
  validates_presence_of :first_name, :last_name, :gender, :email, :password, :primary_phone_number, :on => :create

  def has_interest?(interest)
    (self.areas_of_interest || "").split(',').include?(interest)
  end
  
  def other_interests
    other_interests = (self.areas_of_interest || "").split(',').reject do |x|
      ["Community Service", "Cultural", "Dinner Group", "Leadership", "Professional", "Social"].include?(x)
    end
    other_interests.join(',')
  end  
  
end
