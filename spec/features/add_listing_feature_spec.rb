feature 'add listing' do
  scenario 'user can add a listing to the list of spaces' do
    User.create(first_name: 'Rob', last_name: 'Oman', email: 'r@r.com', password_digest: '$2a$12$UQSjfRgb7T0iPTKp23JfgeJXYDoItn3Ex2qHmEXoTms8qUB51LKBW')
    User.create(first_name: 'Phil', last_name: 'Bligh', email: 'p@p.com', password_digest: '$2a$12$UQSjfRgb7T0iPTKp23JfgeJXYDoItn3Ex2qHmEXoTms8qUB51LKBW')

    user_signs_in('r@r.com', 'test')
    click_link 'Add listing'

    fill_in 'name', with: 'the pyramids'
    fill_in 'description', with: 'old-fashioned interior'
    fill_in 'price', with: 500000
    within '#dates_form' do
      fill_in name: 'available_from', with: '2022-04-01'
    end
    within '#dates_form' do
      fill_in name: 'available_to', with: '2022-05-01'
    end

    click_button 'Submit'

    user_logs_out

    user_signs_in('p@p.com', 'test')

    expect(current_path).to eq '/spaces'

    fill_in name: 'available_from', with: '2022-04-15'
    fill_in name: 'available_to', with: '2022-07-01'

    click_button 'Submit'

    expect(page).to have_content 'the pyramids'
    expect(page).to have_content 'old-fashioned interior'
  end
end