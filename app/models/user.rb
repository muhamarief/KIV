class User < ApplicationRecord
  include Clearance::User

  validates :email, uniqueness:{ message: "Your email has already been taken!"}
  validates :email, presence: { message: "You need to type in an email!"}

  enum role: ['customer', 'admin']
  
  def self.create_with_auth_and_hash(authentication, auth_hash)
      user = User.create!(name: auth_hash["first_name"]["last_name"], email: auth_hash["extra"]["raw_info"]["email"])
      user.authentications << (authentication)      
	
	return user
  
  end

  def fb_token
    x = self.authentications.where(:provider => :facebook).first
    return x.token unless x.nil?
  end

end


  