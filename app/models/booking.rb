class Booking < ApplicationRecord
  belongs_to :flight
  has_many :passengers
  accepts_nested_attributes_for :passengers

  def passengers_attributes=(passengers_attributes)
    passengers_attributes.each do |i, passengers_attributes|
      self.passengers.build(passengers_attributes)
    end
  end
end
