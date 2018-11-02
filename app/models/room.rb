class Room < ApplicationRecord

  ROOM_TYPES = ["shared", "entire", "private"].freeze
  
  validates: :name, :home_type, :room_type, :home_type, :accommodate, presence: true
  validates: :room_type, inclusion: { in: ROOM_TYPES, message: "%{value} is not valid %{model} type."

  belongs_to :user

end
