module NegativeSteps

# GIVEN
  step 'login page with empty password' do
    @home_page = Home.new
    @home_page.load
    @home_page.login_btn.click
    @home_page.set_user_email('su160985pev@gmail.com')
  end

  step 'login page with empty email and password' do
    @home_page = Home.new
    @home_page.load
    @home_page.login_btn.click
  end

  step 'login page with empty email' do
    @home_page = Home.new
    @home_page.load
    @home_page.login_btn.click
    @home_page.set_password('test_password')
  end

  step 'login page with incorrect email' do
    @home_page = Home.new
    @home_page.load
    @home_page.login_btn.click
    @home_page.set_user_email('incorrect_email@gmail.com')
    @home_page.set_password('test_password')
  end

  step 'login page with incorrect password' do
    @home_page = Home.new
    @home_page.load
    @home_page.login_btn.click
    @home_page.set_user_email('su160985pev@gmail.com')
    @home_page.set_password('incorrect_password')
  end

  step 'login page with incorrect password and email' do
    @home_page = Home.new
    @home_page.load
    @home_page.login_btn.click
    @home_page.set_user_email('incorrect_email@gmail.com')
    @home_page.set_password('incorrect_password')
  end

# AND
  step 'try to login' do
    @home_page.login_section.login_button.click
  end

# THEN
  step 'get an error of incorrect email or password' do
    expect(@home_page).to have_flash_alert
    expect(@home_page.flash_alert.text).to eq('Invalid email or password.')
  end
end

RSpec.configure { |c| c.include NegativeSteps, negative_steps: true }
