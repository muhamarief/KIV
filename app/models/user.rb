class User < ApplicationRecord
  include Clearance::User

  validates :email, uniqueness:{ message: "Your email has already been taken!"}
  validates :email, presence: { message: "You need to type in an email!"}

  enum role: ['customer', 'admin']
end
