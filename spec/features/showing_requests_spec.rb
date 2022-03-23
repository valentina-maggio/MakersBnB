feature 'seeing requests' do
  scenario 'displays a list of bookings the user has requested' do
    User.create(first_name: 'Rob', last_name: 'Oman', email: 'r@m.com', password_digest: '')
    User.create(first_name: 'Phil', last_name: 'Bligh', email: 'p@m.com', password_digest: '')
    Space.create(user_id: 1, name: 'Makers', description: 'Big warehouse', price: 10000, picture: '', available_from: Time.now, available_to: Time.now)
    Status.create(status_value: 'confirmed')
    Booking.create(space_id: 1, user_id: 2, date: Time.now, status_id: 1)
    visit '/requests/1' 

    expect(page).to have_text ('Booking request: Makers, 01-04-2022, status: confirmed')
  end

end