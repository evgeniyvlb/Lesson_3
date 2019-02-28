require 'capybara'
require 'capybara/dsl'
include Capybara::DSL

require './page_object.rb'
require 'site_prism'

Capybara.default_driver = :firefox
Capybara.register_driver :firefox do |app|
  options = {
    js_errors: true,
    timeout: 360
  }
  Capybara::Selenium::Driver.new(app, browser: :firefox)
end

# tc_01
begin
  puts 'tc_01 started'
  tc_01 = []
  @home_page = Home.new
  @home_page.load
  @home_page.login_btn.click
  @home_page.title == 'Demo web application - Login form' ? tc_01.push('passed') : tc_01.push('failed')
  puts "tc_01 : #{tc_01}"
rescue StandardError => e
  puts "tc_02 is failed due to #{e}"
end

# tc_02
begin
  puts 'tc_02 started'
  @home_page = Home.new
  @home_page.load
  @home_page.login_btn.click
  @home_page.set_useremail('su160985pev@gmail.com')
  @home_page.set_password('test_password')
  @home_page.loginsection.loginbutton.click
  @home_page.find_logout_btn(@home_page.has_logout_btn?, 'tc_02')
rescue StandardError => e
  puts "tc_02 is failed due to #{e}"
end

# tc_03_1
begin
  puts 'tc_03_1 started'
  @home_page = Home.new
  @home_page.load
  @home_page.login_btn.click
  @home_page.set_useremail('su160985pev@gmail.com')
  @home_page.set_password('test_password')
  @home_page.loginsection.rememberme.click
  @home_page.loginsection.loginbutton.click
  @home_page.find_logout_btn(@home_page.has_logout_btn?, 'tc_03_1')
rescue StandardError => e
  puts "tc_03_1 is failed due to #{e}"
end

# tc_03_2
begin
  puts 'tc_03_2 started'
  @home_page = Home.new
  @home_page.load
  @home_page.find_logout_btn(@home_page.has_logout_btn?, 'tc_03_2')
  Capybara.reset_sessions!
rescue StandardError => e
  puts "tc_03_2 is failed due to #{e}"
end

# tc_03_3
begin
  puts 'tc_03_3 started'
  tc_03_3 = []
  @home_page = Home.new
  @home_page.load
  @home_page.has_logout_btn? ? tc_03_3.push('failed') : tc_03_3.push('passed')
  puts "tc_03_3 : #{tc_03_3}"
rescue StandardError => e
  puts "tc_04_1 is failed due to #{e}"
end

# tc_04_1
begin
  puts 'tc_04_1 started'
  @home_page = Home.new
  @home_page.load
  @home_page.login_btn.click
  @home_page.set_useremail('su160985pev@gmail.com')
  @home_page.loginsection.loginbutton.click
  @home_page.find_alert(@home_page.has_flash_alert?, @home_page.flash_alert, 'tc_04_1')
rescue StandardError => e
  puts "tc_04_1 is failed due to #{e}"
end

# tc_04_2
begin
  puts 'tc_04_2 started'
  @home_page = Home.new
  @home_page.load
  @home_page.login_btn.click
  @home_page.set_password('test_password')
  @home_page.loginsection.loginbutton.click
  @home_page.find_alert(@home_page.has_flash_alert?, @home_page.flash_alert, 'tc_04_2')
rescue StandardError => e
  puts "tc_04_2 is failed due to #{e}"
end

# tc_04_3
begin
  puts 'tc_04_3 started'
  @home_page = Home.new
  @home_page.load
  @home_page.login_btn.click
  @home_page.loginsection.loginbutton.click
  @home_page.find_alert(@home_page.has_flash_alert?, @home_page.flash_alert, 'tc_04_3')
rescue StandardError => e
  puts "tc_04_3 is failed due to #{e}"
end

# tc_05_1
begin
  puts 'tc_05_1 started'
  @home_page = Home.new
  @home_page.load
  @home_page.login_btn.click
  @home_page.set_useremail('incorrect_mail@gmail.com')
  @home_page.set_password('test_password')
  @home_page.loginsection.loginbutton.click
  @home_page.find_alert(@home_page.has_flash_alert?, @home_page.flash_alert, 'tc_05_1')
rescue StandardError => e
  puts "tc_05_1 is failed due to #{e}"
end

# tc_05_2
begin
  puts 'tc_05_2 started'
  @home_page = Home.new
  @home_page.load
  @home_page.login_btn.click
  @home_page.set_useremail('su160985pev@gmail.com')
  @home_page.set_password('incorrect_password')
  @home_page.loginsection.loginbutton.click
  @home_page.find_alert(@home_page.has_flash_alert?, @home_page.flash_alert, 'tc_05_2')
rescue StandardError => e
  puts "tc_05_2 is failed due to #{e}"
end

# tc_05_3
begin
  puts 'tc_05_3 started'
  @home_page = Home.new
  @home_page.load
  @home_page.login_btn.click
  @home_page.set_useremail('incorrect_mail@gmail.com')
  @home_page.set_password('incorrect_password')
  @home_page.loginsection.loginbutton.click
  @home_page.find_alert(@home_page.has_flash_alert?, @home_page.flash_alert, 'tc_05_3')
rescue StandardError => e
  puts "tc_05_3 is failed due to #{e}"
end
