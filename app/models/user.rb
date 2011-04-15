class User < ActiveRecord::Base
  acts_as_authentic do |c|
    c.login_field = 'email'
  end

  validates_presence_of :first_name, :last_name, :gender, :email, :password, :primary_phone_number, :on => :create

  def self.export_csv
    headers = [
      :email,
      :first_name,
      :last_name,
      :middle_name,
      :gender,
      :age_group,
      :primary_phone_number,
      :street_address,
      :city,
      :state,
      :zip_code,
      :undergrad_school,
      :undergrad_major,
      :graduate_school,
      :graduate_major,
      :other_degrees,
      :industry_field,
      :company_name,
      :title_position_function,
      :years_experience,
      :areas_of_interest,
      :other_community_organizations,
      :potential_mentor,
      :potential_mentee,
      :help_at_workshop_panels,
      :opt_in_directory
    ]
    FasterCSV.generate do |csv|
      csv << headers
      User.all.each do |u|
        csv << headers.map {|header| u[header]}
      end
    end
  end

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
