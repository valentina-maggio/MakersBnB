feature 'User session' do
  scenario 'user is redirected to home page if not signed in' do
    visit('/spaces')
    expect(page.current_path).to eq('/')
  end
end