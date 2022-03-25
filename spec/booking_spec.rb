require 'booking'

describe Booking do
  it "returns the correct date format" do
    booking = Booking.create(space_id: '', user_id: '', date: Time.new(2022, 7, 11, 21), status_id: '')
    expect(booking.date).to eq '11/07/2022'
  end
end