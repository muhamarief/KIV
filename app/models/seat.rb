class Seat < ApplicationRecord
  belongs_to :booking
  belongs_to :screening, :dependent => :destroy

end