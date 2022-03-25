feature 'select a date' do
  scenario 'displays a confirmation once booked' do
    Status.create(status: 'pending')
    Status.create(status: 'confirmed')
    Status.create(status: 'rejected')
    create_spaces

    visit '/spaces'

    within '#dates_form' do
      fill_in name: 'available_from', with: '2022-04-01'
    end
    within '#dates_form' do
      fill_in name: 'available_to', with: '2022-05-01'
    end
    visit '/spaces/1'
    select '01/04/2022', from: 'date_selector'
    click_button 'Submit' 

    expect(page).to have_text ('Your booking for Buckingham Palace for 01/04/2022 is pending')
  end

end





