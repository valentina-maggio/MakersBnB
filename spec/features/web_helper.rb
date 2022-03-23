def user_signs_up
  visit '/'
  click_button('Sign up')
  fill_in('email', with: 'test@test.com')
  fill_in('password', with: 'test12')
  fill_in('first_name', with: 'Felix')
  fill_in('last_name', with: 'Taljaard')
  click_button('Sign up')
end
