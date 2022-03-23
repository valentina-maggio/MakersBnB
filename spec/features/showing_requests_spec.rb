feature 'seeing requests' do
  scenario 'displays a list of bookings the user has requested' do
    User.create(first_name: 'Rob', last_name: 'Oman', email: 'r@m.com', password_digest: 'x')
    User.create(first_name: 'Phil', last_name: 'Bligh', email: 'p@m.com', password_digest: 'x')
    Space.create(user_id: 1, name: 'Big Ben', description: 'BONG', price: 10000, picture: 'x', available_from: Time.now, available_to: Time.now)
    Status.create(status: 'confirmed')
    Booking.create(space_id: 1, user_id: 2, date: Time.now, status_id: 1)
    visit '/requests/1' 

    expect(page).to have_text ('Booking: Big Ben on 18-03-2022')
  end

end