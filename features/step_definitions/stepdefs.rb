require_relative '../../lib/webstrongqa.rb'

# GIVEN
  Given ("home page of web application") do
    @home_page = Home.new
    @home_page.load
  end

  Given ("reset browser session") do
    @home_page = Home.new
    @home_page.load
    if expect(@home_page).to have_logout_btn
      @home_page.logout_btn.click
      Capybara.reset_sessions!
    else
      Capybara.reset_sessions!
    end
  end

  Given ("the user is signed in") do
    @home_page = Home.new
    @home_page.load
    @home_page.login_btn.click
    @home_page.set_user_email('su160985pev@gmail.com')
    @home_page.set_password('test_password')
    @home_page.login_section.login_button.click
  end

  Given ("the user is signed in and remembered") do
    Capybara.reset_sessions!
    @home_page = Home.new
    @home_page.load
    @home_page.login_btn.click
    @home_page.set_user_email('su160985pev@gmail.com')
    @home_page.set_password('test_password')
    @home_page.login_section.remember_me.click
    @home_page.login_section.login_button.click
  end

  Given ("login page with empty password") do
    @home_page = Home.new
    @home_page.load
    @home_page.login_btn.click
    @home_page.set_user_email('su160985pev@gmail.com')
  end

  Given ("login page with empty email and password") do
    @home_page = Home.new
    @home_page.load
    @home_page.login_btn.click
  end

  Given ("login page with incorrect email") do
    @home_page = Home.new
    @home_page.load
    @home_page.login_btn.click
    @home_page.set_user_email('incorrect_email@gmail.com')
    @home_page.set_password('test_password')
  end

  Given ("login page with incorrect password") do
    @home_page = Home.new
    @home_page.load
    @home_page.login_btn.click
    @home_page.set_user_email('su160985pev@gmail.com')
    @home_page.set_password('incorrect_password')
  end

  Given ("login page with incorrect password and email") do
    @home_page = Home.new
    @home_page.load
    @home_page.login_btn.click
    @home_page.set_user_email('incorrect_email@gmail.com')
    @home_page.set_password('incorrect_password')
  end

  Given ("login page with empty email") do
    @home_page = Home.new
    @home_page.load
    @home_page.login_btn.click
    @home_page.set_password('test_password')
  end

# AND
  And ("is on the home page") do
    expect(@home_page.title).to eq('Demo web application - Home')
    expect(@home_page).to have_logout_btn
  end

  And ("is already signed in") do
    expect(@home_page.title).to eq('Demo web application - Home')
    expect(@home_page).to have_logout_btn
  end

  And ("try to login") do
    @home_page.login_section.login_button.click
  end

# WHEN
  When ("click Log In menu item on home page") do
    @home_page.login_btn.click
  end

  When ("navigate to home page") do
    @home_page = Home.new
    @home_page.load
  end

# THEN
  Then ("is on login page") do
    expect(@home_page.title).to eq('Demo web application - Login form')
  end

  Then ("is unauthenticated at home page") do
    expect(@home_page).to_not have_logout_btn
  end

  Then ("get an error of incorrect email or password") do
    expect(@home_page).to have_flash_alert
    expect(@home_page.flash_alert.text).to eq('Invalid email or password.')
  end
