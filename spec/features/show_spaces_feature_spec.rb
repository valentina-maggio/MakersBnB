feature 'showing property names and description' do

  before do
    create_spaces
  end

  scenario 'navigating to /spaces shows all spaces in database' do
    expect(page).to have_content('Nice and spacious. Must like dogs')
    expect(page).to have_content('Recent new hosts, looking to improve reputation')
    expect(page).to have_content('Pointy, with beautiful view')
    expect(page).to have_content('A big noisy, but nice')

  end

  scenario 'navigating to /spaces has date selectors' do
    expect(page).to have_field('available_from')
    expect(page).to have_field('available_to')
    fill_in name: 'available_from', with: '2022-04-15'
    fill_in name: 'available_to', with: '2022-07-01'

    click_button 'Submit'
    
    expect(page).to have_content('The Shard')
    expect(page).to have_content('Big Ben')
    expect(page).not_to have_content('Buckingham Palace')
    expect(page).not_to have_content('The White House')
  end

end
