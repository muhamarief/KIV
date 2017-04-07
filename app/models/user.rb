class User < ApplicationRecord

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  belongs_to :role

  validates_presence_of :username
  validates :email, uniqueness:{ message: "Your email has already been taken!"}
  validates :email, presence: { message: "You need to type in an email!"}
  # before_save :assign_role

  def assign_role
    self.role = Role.find_by(name: "Customer") unless self.role
  end
end
