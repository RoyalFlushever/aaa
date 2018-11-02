class Room < ApplicationRecord
  validates: :name, :home_type, :room_type, :home_type, :accommodate, presence: true
end
