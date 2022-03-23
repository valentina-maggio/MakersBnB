require 'spec_helper'

feature 'Registrations' do
  scenario 'user can sign up and be signed in' do
    visit('registrations/new')
    fill_in('email', with: 'test@test.com')
    fill_in('password', with: 'test12')
    fill_in('first_name', with: 'Felix')
    fill_in('last_name', with: 'Taljaard')
    click_button('Sign up')
    expect(page.current_path).to eq('/spaces')
    #expect(page).to have_content ('Welcome to MakersBnB!')
    expect(page).to have_button('Add listing')
  end

  scenario 'missing field and is redirected' do
    visit('registrations/new')
    fill_in('email', with: 'test@test.com')
    fill_in('password', with: 'test12')
    fill_in('first_name', with: 'Valentina')
    fill_in('last_name', with: '')
    click_button('Sign up')
    expect(page).to have_content 'One of the required field is empty or contains invalid data; please check your input.'
    expect(page.current_path).to eq('/registrations/new')
  end
end