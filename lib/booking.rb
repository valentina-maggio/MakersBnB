class Booking < ActiveRecord::Base
  has_one :status
end