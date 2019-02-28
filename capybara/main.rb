require 'capybara'
require 'capybara/dsl'
include Capybara::DSL

def select_browser(type)
  if type == 'ff'
    Capybara.default_driver = :firefox
    Capybara.register_driver :firefox do |app|
      options = {
        js_errors: true,
        timeout: 360,
        debug: false,
        inspector: false
      }
      Capybara::Selenium::Driver.new(app, browser: :firefox)
    end
  elsif type == 'chrom'
    Capybara.default_driver = :chrome
    Capybara.register_driver :chrome do |app|
      options = {
        js_errors: false,
        timeout: 360,
        debug: false,
        inspector: false
      }
      Capybara::Selenium::Driver.new(app, browser: :chrome, args: ['--window-size=1280,720'])
    end
  elsif type == 'ie'
    Capybara.default_driver = :ie
    Capybara.register_driver :ie do |app|
      options = {
        js_errors: false,
        timeout: 360,
        debug: false,
        inspector: false
      }
      Capybara::Selenium::Driver.new(app, browser: :ie)
    end
  end
end

# tc_01
tc_01 = []
%w[ff chrom ie].each do |b|
  select_browser(b)
  visit('http://demoapp.strongqa.com')
  find(:xpath, "//a[contains(text(), 'Login')]").click
  title == 'Demo web application - Login form' ? tc_01.push('passed') : tc_01.push('failed')
end
puts "tc_01 : #{tc_01} "

# tc_02
tc_02 = []
%w[ff chrom ie].each do |b|
  select_browser(b)
  visit('http://demoapp.strongqa.com')
  find(:xpath, "//a[contains(text(), 'Login')]").click
  find_field(id: 'user_email').set('su160985pev@gmail.com')
  find_field(id: 'user_password').set('test_password')
  click_button 'Log in'
  title == 'Demo web application - Home' ? tc_02.push('passed') : tc_02.push('failed')
  page.driver.quit
end
puts "tc_02 : #{tc_02}"

# tc_03_1
tc_03_1 = []
%w[ff chrom ie].each do |b|
  select_browser(b)
  visit('http://demoapp.strongqa.com')

  find(:xpath, "//a[contains(text(), 'Login')]").click
  find_field(id: 'user_email').set('su160985pev@gmail.com')
  find_field(id: 'user_password').set('test_password')
  find(:xpath, "//label[@for='user_remember_me']").click
  click_button 'Log in'
  page.has_xpath?("//a[contains(text(), 'Logout')]") ? tc_03_1.push('passed') : tc_03_1.push('failed')
  page.driver.quit
end
puts "tc_03_1 : #{tc_03_1}"

# tc_03_2
tc_03_2 = []
%w[ff chrom ie].each do |b|
  select_browser(b)
  visit('http://demoapp.strongqa.com')
  puts page.has_xpath?("//a[contains(text(), 'Logout')]")
  page.has_xpath?("//a[contains(text(), 'Logout')]") ? tc_03_2.push('passed') : tc_03_2.push('failed')
  page.driver.quit
end
puts "tc_03_2 : #{tc_03_2}"

# tc_03_3
tc_03_3 = []
%w[ff chrom ie].each do |b|
  select_browser(b)
  visit('http://demoapp.strongqa.com')
  if page.has_xpath?("//a[contains(text(), 'Logout')]")
    find(:xpath, "//a[contains(text(), 'Logout')]").click
    page.driver.quit
  else page.driver.quit
  end
  visit('http://demoapp.strongqa.com')
  page.has_xpath?("//a[contains(text(), 'Logout')]") ? tc_03_3.push('failed') : tc_03_3.push('passed')
end
puts "tc_03_3 : #{tc_03_3}"

# tc_04_1
tc_04_1 = []
%w[ff chrom ie].each do |b|
  select_browser(b)
  visit('http://demoapp.strongqa.com')
  find(:xpath, "//a[contains(text(), 'Login')]").click
  find_field(id: 'user_email').set('su160985pev@gmail.com')
  click_button 'Log in'
  if page.has_selector?('#flash_alert')
    find('#flash_alert').text == 'Invalid email or password.' ? tc_04_1.push('passed') : tc_04_1.push('failed')
  else tc_04_1.push('failed')
  end
end
puts tc_04_1

# tc_04_2
tc_04_2 = []
%w[ff chrom ie].each do |b|
  select_browser(b)
  visit('http://demoapp.strongqa.com')
  find(:xpath, "//a[contains(text(), 'Login')]").click
  find_field(id: 'user_password').set('test_password')
  click_button 'Log in'
  if page.has_selector?('#flash_alert')
    find('#flash_alert').text == 'Invalid email or password.' ? tc_04_2.push('passed') : tc_04_2.push('failed')
  else tc_04_2.push('failed')
  end
end
puts tc_04_2

# tc_04_3
tc_04_3 = []
%w[ff chrom ie].each do |b|
  select_browser(b)
  visit('http://demoapp.strongqa.com')
  find(:xpath, "//a[contains(text(), 'Login')]").click
  click_button 'Log in'
  if page.has_selector?('#flash_alert')
    find('#flash_alert').text == 'Invalid email or password.' ? tc_04_3.push('passed') : tc_04_3.push('failed')
  else tc_04_3.push('failed')
  end
end
puts tc_04_3

# tc_05_1
tc_05_1 = []
%w[ff chrom ie].each do |b|
  select_browser(b)
  visit('http://demoapp.strongqa.com')
  find(:xpath, "//a[contains(text(), 'Login')]").click
  find_field(id: 'user_email').set('incorrect_mail@gmail.com')
  find_field(id: 'user_password').set('test_password')
  click_button 'Log in'
  if page.has_selector?('#flash_alert')
    find('#flash_alert').text == 'Invalid email or password.' ? tc_05_1.push('passed') : tc_05_1.push('failed')
  else tc_05_1.push('failed')
  end
end
puts tc_05_1

# tc_05_2
tc_05_2 = []
%w[ff chrom ie].each do |b|
  select_browser(b)
  visit('http://demoapp.strongqa.com')
  find(:xpath, "//a[contains(text(), 'Login')]").click
  find_field(id: 'user_email').set('su160985pev@gmail.com')
  find_field(id: 'user_password').set('incorrect_password')
  click_button 'Log in'
  if page.has_selector?('#flash_alert')
    find('#flash_alert').text == 'Invalid email or password.' ? tc_05_2.push('passed') : tc_05_2.push('failed')
  else tc_05_2.push('failed')
  end
end
puts tc_05_2

# tc_05_3
tc_05_3 = []
%w[ff chrom ie].each do |b|
  select_browser(b)
  visit('http://demoapp.strongqa.com')
  find(:xpath, "//a[contains(text(), 'Login')]").click
  find_field(id: 'user_email').set('incorrect_mail@gmail.com')
  find_field(id: 'user_password').set('incorrect_password')
  click_button 'Log in'
  if page.has_selector?('#flash_alert')
    find('#flash_alert').text == 'Invalid email or password.' ? tc_05_3.push('passed') : tc_05_3.push('failed')
  else tc_05_3.push('failed')
  end
end
puts tc_05_3
