class Movie < ApplicationRecord
  has_many :showplaces
  has_many :cinemas, through: :showplaces

  mount_uploaders :photos, MoviePicturesUploader
end
