class Movie < ApplicationRecord
  has_many :showplaces
  has_many :cinemas, through: :showplaces
end
