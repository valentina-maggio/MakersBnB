feature 'showing property names and description' do
  scenario 'navigating to /spaces shows all spaces in database' do
    # add spaces to database
    Space.create(name: 'Buckingham Palace',
      description: 'Nice and spacious. Must like dogs', 
      price: 1000000,
      picture: nil,
      available_from: Time.now,
      available_to: Time.now)
    Space.create(name: 'The White House',
      description: 'Recent new hosts, looking to improve reputation', 
      price: 1000000,
      picture: nil,
      available_from: Time.now,
      available_to: Time.now)

    visit '/spaces'

    expect(page).to have_content('Buckingham Palace')
    expect(page).to have_content('Nice and spacious. Must like dogs')
    expect(page).to have_content('The White House')
    expect(page).to have_content('Recent new hosts, looking to improve reputation')

  end
end
