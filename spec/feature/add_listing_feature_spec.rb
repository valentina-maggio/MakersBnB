feature 'add listing' do
  scenario 'user can add a listing to the list of spaces' do
    user_signs_up
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

    expect(current_path).to eq '/spaces'

    expect(page).to have_content 'the pyramids'
    expect(page).to have_content 'old-fashioned interior'
  end
end