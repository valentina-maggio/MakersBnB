class Status < ActiveRecord::Base
  has_many :bookings
end