class Booking < ApplicationRecord
  belongs_to :property
  validates :name, :start_time, :end_time, presence: true
end
