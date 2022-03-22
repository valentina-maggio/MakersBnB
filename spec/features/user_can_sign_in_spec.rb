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
    expect(page.current_path).to eq('/')
    expect(page).to have_content 'Welcome to MakersBnB!'
  end
end