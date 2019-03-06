require_relative '../../lib/webstrongqa.rb'

module Turnip::Steps

  # GIVEN
    step 'home page of web application' do
      @home_page = Home.new
      @home_page.load
    end

  # WHEN
    step 'I click Log In menu item on home page' do
      @home_page.login_btn.click
    end

    step 'I fill email and password field' do
      @home_page.set_user_email('su160985pev@gmail.com')
      @home_page.set_password('test_password')
    end

    step 'I fill email field' do
      @home_page.set_user_email('su160985pev@gmail.com')
    end

    step 'I fill password field' do
      @home_page.set_password('test_password')
    end

  # AND
    step 'I click Login button on Login page' do
      @home_page.login_section.login_button.click
    end

    step 'I click Remember me button on Login page' do
      @home_page.login_section.remember_me.click
    end

  # THEN
    step 'I get to login page' do
      expect(@home_page.title).to eq('Demo web application - Login form')
    end

    step 'I get to user home page' do
      expect(@home_page).to have_logout_btn
    end

    step 'I get to user home page and then logout' do
      expect(@home_page).to have_logout_btn
      Capybara.reset_sessions!
    end

    step 'I can not get to user home page' do
      expect(@home_page).to_not have_logout_btn
      Capybara.reset_sessions!
    end
end
