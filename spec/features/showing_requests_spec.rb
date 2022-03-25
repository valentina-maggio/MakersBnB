feature 'seeing requests' do
  scenario 'displays a list of bookings the user has requested' do
    User.create(first_name: 'Rob', last_name: 'Oman', email: 'r@r.com', password_digest: '$2a$12$UQSjfRgb7T0iPTKp23JfgeJXYDoItn3Ex2qHmEXoTms8qUB51LKBW')
    User.create(first_name: 'Phil', last_name: 'Bligh', email: 'p@p.com', password_digest: '$2a$12$UQSjfRgb7T0iPTKp23JfgeJXYDoItn3Ex2qHmEXoTms8qUB51LKBW')
    Space.create(user_id: 1, name: 'Big Ben', description: 'BONG', price: 10000, picture: 'x', available_from: Time.now, available_to: Time.now)
    Status.create(status: 'confirmed')
    Booking.create(space_id: 1, user_id: 2, date: Time.new(2022, 03, 18, 12), status_id: 1)
    user_signs_in('p@p.com', 'test')
    visit '/requests' 

    expect(page).to have_text ('Booking: Big Ben on 18/03/2022')
  end

  scenario 'displays a list of bookings the user has received' do
    User.create(first_name: 'Rob', last_name: 'Oman', email: 'r@r.com', password_digest: '$2a$12$UQSjfRgb7T0iPTKp23JfgeJXYDoItn3Ex2qHmEXoTms8qUB51LKBW')
    User.create(first_name: 'Phil', last_name: 'Bligh', email: 'p@p.com', password_digest: '$2a$12$UQSjfRgb7T0iPTKp23JfgeJXYDoItn3Ex2qHmEXoTms8qUB51LKBW')
    Space.create(user_id: 1, name: 'Big Ben', description: 'BONG', price: 10000, picture: 'x', available_from: Time.now, available_to: Time.now)
    Status.create(status: 'confirmed')
    Booking.create(space_id: 1, user_id: 2, date: Time.new(2022, 03, 18, 12), status_id: 1)
    user_signs_in('r@r.com', 'test')
    visit '/requests' 

    expect(page).to have_text ('Booking: Big Ben on 18/03/2022')
  end
end