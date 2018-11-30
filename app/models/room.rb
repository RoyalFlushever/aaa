class Room < ApplicationRecord

  ROOM_TYPES = ["shared", "entire", "private"].freeze
  HOME_TYPES = %w(house apartment bed&breakfast)
  
  validates :home_type, :room_type, :accommodate, :bedroom, :bathroom, presence: true
  validates :room_type, inclusion: { in: ROOM_TYPES, message: "%{value} is not valid %{model} type." }
  validates :home_type, inclusion: { in: HOME_TYPES }

  belongs_to :user

end
