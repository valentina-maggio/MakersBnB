feature 'welcome page' do
  scenario 'user can either sign up or sign in' do 
    visit('/')
    expect(page).to have_button('Sign in')
    expect(page).to have_button('Sign up')
  end

  scenario 'user can click on sign up button and be redirected to sign up page' do 
    visit('/')
    click_button('Sign up')
    expect(page).to have_content 'Please enter registration details'
    expect(page.current_path).to eq('/registrations/new')
  end


  scenario 'user can click on sign up button and be redirected to sign in page' do 
    visit('/')
    click_button('Sign in')
    expect(page).to have_content 'Please enter your login details'
    expect(page.current_path).to eq('/sign_in') 
  end
end
