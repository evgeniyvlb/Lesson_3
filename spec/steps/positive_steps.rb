require_relative '../../lib/webstrongqa.rb'

module Turnip::Steps

  # GIVEN
    step 'home page of web application' do
      @home_page = Home.new
      @home_page.load
    end

  # GIVEN
    step 'reset browser session' do
      if expect(@home_page).to have_logout_btn
        @home_page.logout_btn.click
        Capybara.reset_sessions!
      else
        Capybara.reset_sessions!
      end
    end

    step 'the user is signed in' do
      @home_page = Home.new
      @home_page.load
      @home_page.login_btn.click
      @home_page.set_user_email('su160985pev@gmail.com')
      @home_page.set_password('test_password')
      @home_page.login_section.login_button.click
    end

    step 'the user is signed in and remembered' do
      Capybara.reset_sessions!
      @home_page = Home.new
      @home_page.load
      @home_page.login_btn.click
      @home_page.set_user_email('su160985pev@gmail.com')
      @home_page.set_password('test_password')
      @home_page.login_section.remember_me.click
      @home_page.login_section.login_button.click
    end

    step 'reset browser session' do
      @home_page = Home.new
      @home_page.load
      @home_page.logout_btn.click
    end

  # WHEN
    step 'click Log In menu item on home page' do
      @home_page.login_btn.click
    end

    step 'navigate to home page' do
      @home_page = Home.new
      @home_page.load
    end

  # AND
    step 'is on the home page' do
      expect(@home_page.title).to eq('Demo web application - Home')
      expect(@home_page).to have_logout_btn
    end

    step 'is already signed in' do
      expect(@home_page.title).to eq('Demo web application - Home')
      expect(@home_page).to have_logout_btn
    end

  # THEN
    step 'is on login page' do
      expect(@home_page.title).to eq('Demo web application - Login form')
    end

    step 'is unauthenticated at home page' do
      expect(@home_page).to_not have_logout_btn
    end
end
