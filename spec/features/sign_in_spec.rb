require 'spec_helper'

feature 'Log in' do
  before do
    user = User.new(email: 'test@test.com', first_name: 'Valentina', last_name: 'Maggio')
    user.password = 'test12'
    user.save!
  end

  scenario 'user can sign in' do
    visit('/sign_in')
    fill_in('email', with: 'test@test.com')
    fill_in('password', with: 'test12')
    click_button('Sign in')
    expect(page.current_path).to eq('/spaces')
    #expect(page).to have_content 'Welcome to MakersBnB!'
    expect(page).to have_button('Add listing')
  end

  scenario 'wrong email and is redirected' do
    visit('/sign_in')
    fill_in('email', with: 'wrong_test@test.com')
    fill_in('password', with: 'test12')
    click_button('Sign in')
    expect(page).to have_content 'One of the required field is empty or contains invalid data; please check your input.'
    expect(page.current_path).to eq('/sign_in')
  end

  scenario 'wrong password and is redirected' do
    visit('/sign_in')
    fill_in('email', with: 'test@test.com')
    fill_in('password', with: 'wrongtest12')
    click_button('Sign in')
    expect(page).to have_content 'One of the required field is empty or contains invalid data; please check your input.'
    expect(page.current_path).to eq('/sign_in')
  end
end