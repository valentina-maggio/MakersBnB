feature 'select a date' do
  scenario 'displays a confirmation once booked' do
    user_signs_up
    Space.create(user_id: 1, name: 'Makers', description: 'Big warehouse', price: 10000, picture: '', available_from: Time.now, available_to: Time.now)
    Status.create(status: 'confirmed')
    visit '/spaces/1'
    within '#dates_form' do
      fill_in name: 'date', with: '2022-04-01'
    end
    click_button 'Submit' 

    expect(page).to have_text ('Your booking for Makers for 01-04-2022 is confirmed')
  end

end