require 'rspec'
require 'site_prism'
require 'capybara'
require 'capybara/dsl'
include Capybara::DSL

Capybara.default_driver = :firefox
Capybara.register_driver :firefox do |app|
  options = {
    js_errors: true,
    timeout: 360
  }
  Capybara::Selenium::Driver.new(app, browser: :firefox)
end

class LoginSection < SitePrism::Section
  element :user_email, '#user_email'
  element :password, '#user_password'
  element :login_button, 'input[name="commit"]'
  element :remember_me, :xpath, '//label[@for="user_remember_me"]'
end

class Home < SitePrism::Page
  set_url 'http://demoapp.strongqa.com'
  element :login_btn, :xpath, '//a[contains(text(), "Login")]'
  element :logout_btn, :xpath, '//a[contains(text(), "Logout")]'
  element :flash_alert, '#flash_alert'
  section :login_section, LoginSection, '.authform'

  def set_user_email(user_email)
    login_section.user_email.set user_email
  end

  def set_password(password)
    login_section.password.set password
  end

end
