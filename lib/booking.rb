class Booking < ActiveRecord::Base
  belongs_to :user
  belongs_to :space
  belongs_to :status

  def date
    super.strftime('%d/%m/%Y')
  end
end