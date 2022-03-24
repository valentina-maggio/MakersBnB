feature 'Confirm request' do
  scenario 'user can confirm request' do
    User.create(first_name: 'Felix', last_name: 'Maker', email: 'f@f.com', password_digest: '$2a$12$UQSjfRgb7T0iPTKp23JfgeJXYDoItn3Ex2qHmEXoTms8qUB51LKBW')
    User.create(first_name: 'Phil', last_name: 'Maker', email: 'p@p.com', password_digest: '$2a$12$UQSjfRgb7T0iPTKp23JfgeJXYDoItn3Ex2qHmEXoTms8qUB51LKBW')

    Status.create(status: 'pending')
    Status.create(status: 'confirmed')
    Status.create(status: 'rejected')


    Space.create(name: 'The White House',
      description: 'Recent new hosts, looking to improve reputation', 
      price: 1000000,
      picture: nil,
      available_from: Time.now,
      available_to: Time.now,
      user_id: 2)


      user_signs_in('f@f.com', 'test')
      click_link(text: "The White House", href: '/spaces/1')
      within '#dates_form' do
        fill_in name: 'date', with: '2022-04-01'
      end
      click_button('Submit')
      expect(page).to have_content('pending')
      user_logs_out

      user_signs_in('p@p.com', 'test')

      click_link(id: 'my_requests')
      click_button('Confirm booking')

      user_logs_out

      user_signs_in('f@f.com', 'test')
      click_link(id: 'my_requests')

      expect(page).to have_content('Status: confirmed')

  end
end

