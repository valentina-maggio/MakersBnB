class Booking < ActiveRecord::Base
  has_one :status
  has_one :space
  has_one :user

  def date
    super.strftime('%d-%m-%Y')
  end
end