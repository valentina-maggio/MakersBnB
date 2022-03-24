def user_signs_up
  visit '/'
  click_button('Sign up')
  fill_in('email', with: 'test@test.com')
  fill_in('password', with: 'test12')
  fill_in('first_name', with: 'Felix')
  fill_in('last_name', with: 'Taljaard')
  click_button('Sign up')
end

def create_spaces
  Space.create(name: 'Buckingham Palace',
    description: 'Nice and spacious. Must like dogs', 
    price: 1000000,
    picture: nil,
    available_from: Time.new(2022, 4, 1, 11),
    available_to: Time.new(2022, 4, 12, 11))
  Space.create(name: 'The White House',
    description: 'Recent new hosts, looking to improve reputation', 
    price: 1000000,
    picture: nil,
    available_from: Time.new(2022, 4, 2, 11),
    available_to: Time.new(2022, 4, 4, 11))
    Space.create(name: 'The Shard',
    description: 'Pointy, with beautiful view', 
    price: 8000000,
    picture: nil,
    available_from: Time.new(2022, 5, 1, 11),
    available_to: Time.new(2022, 5, 12, 11))
    Space.create(name: 'Big Ben',
    description: 'A big noisy, but nice', 
    price: 1500000,
    picture: nil,
    available_from: Time.new(2022, 3, 28, 11),
    available_to: Time.new(2022, 6, 5, 11))
  user_signs_up

end

def user_signs_in(email, password)
  visit '/'
  click_button('Sign in')
  fill_in('email', with: email)
  fill_in('password', with: password)
  click_button('Sign in')
end

def user_logs_out
  visit('/spaces')
  click_button('Sign out')
end