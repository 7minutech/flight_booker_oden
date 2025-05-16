class Flight < ApplicationRecord
  belongs_to :departure_airport, class_name: :airport
  belongs_to :arrival_airport, class_name: :airport
end
