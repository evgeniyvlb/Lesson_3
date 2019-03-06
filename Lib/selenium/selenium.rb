require 'rubygems'
require 'selenium-webdriver'

# tc_01
f = Selenium::WebDriver.for :firefox
ie = Selenium::WebDriver.for :ie
c = Selenium::WebDriver.for :chrome
c.manage.window.maximize
tc_01 = []

[f, c, ie].each do |b|
  b.get 'http://demoapp.strongqa.com'
  sleep 2
  b.find_element(:xpath, "//a[contains(text(), 'Login')]").click
  b.title == 'Demo web application - Login form' ? tc_01.push('passed') : tc_01.push('failed')
  b.quit
end

puts "tc_01 : #{tc_01} "

# tc_02
f = Selenium::WebDriver.for :firefox
ie = Selenium::WebDriver.for :ie
c = Selenium::WebDriver.for :chrome
c.manage.window.maximize
tc_02 = []

[f, c, ie].each do |b|
  b.get 'http://demoapp.strongqa.com'
  sleep 2
  b.find_element(:xpath, "//a[contains(text(), 'Login')]").click
  b.find_element(:id, 'user_email').send_keys 'su160985pev@gmail.com'
  b.find_element(:id, 'user_password').send_keys 'test_password'
  b.find_element(:name, 'commit').click

  b.title == 'Demo web application - Home' ? tc_02.push('passed') : tc_02.push('failed')
  b.quit
end
puts "tc_02 : #{tc_02} "

# tc_03_1
f = Selenium::WebDriver.for :firefox
ie = Selenium::WebDriver.for :ie
c = Selenium::WebDriver.for :chrome
c.manage.window.maximize
tc_03_1 = []

[f, c, ie].each do |b|
  b.get 'http://demoapp.strongqa.com'
  sleep 2
  b.find_element(:xpath, "//a[contains(text(), 'Login')]").click
  b.find_element(:id, 'user_email').send_keys 'su160985pev@gmail.com'
  b.find_element(:id, 'user_password').send_keys 'test_password'
  b.find_element(:xpath, "//label[@for='user_remember_me']").click
  b.find_element(:name, 'commit').click

  b.title == 'Demo web application - Home' ? tc_03_1.push('passed') : tc_03_1.push('failed')
  b.quit
end
puts "tc_03_1 : #{tc_03_1} "

# tc_03_2
f = Selenium::WebDriver.for :firefox
ie = Selenium::WebDriver.for :ie
c = Selenium::WebDriver.for :chrome
c.manage.window.maximize
tc_03_2 = []

[f, c, ie].each do |b|
  b.get 'http://demoapp.strongqa.com'
  b.find_elements(:xpath, "//a[contains(text(), 'Logout')]").empty? ? tc_03_2.push('failed') : tc_03_2.push('passed')
  b.quit
end
puts "tc_03_2 : #{tc_03_2} "

# tc_03_3
f = Selenium::WebDriver.for :firefox
ie = Selenium::WebDriver.for :ie
c = Selenium::WebDriver.for :chrome
c.manage.window.maximize
tc_03_3 = []

[f, c, ie].each do |b|
  b.get 'http://demoapp.strongqa.com'
  if b.find_elements(:xpath, "//a[contains(text(), 'Logout')]").empty?
    b.close
  else b.find_element(:xpath, "//a[contains(text(), 'Logout')]").click
       b.close
  end
end
f = Selenium::WebDriver.for :firefox
ie = Selenium::WebDriver.for :ie
c = Selenium::WebDriver.for :chrome
c.manage.window.maximize
[f, c, ie].each do |b|
  b.get 'http://demoapp.strongqa.com'
  b.find_elements(:xpath, "//a[contains(text(), 'Logout')]").empty? ? tc_03_3.push('passed') : tc_03_3.push('failed')
  b.quit
end
puts "tc_03_3 : #{tc_03_3}"

# tc_04_1
f = Selenium::WebDriver.for :firefox
ie = Selenium::WebDriver.for :ie
c = Selenium::WebDriver.for :chrome
c.manage.window.maximize
tc_04_1 = []

[f, c, ie].each do |b|
  b.get 'http://demoapp.strongqa.com'
  b.find_element(:xpath, "//a[contains(text(), 'Login')]").click
  b.find_element(:id, 'user_email').send_keys 'su160985pev@gmail.com'
  b.find_element(:name, 'commit').click
  s = b.find_element(:id, 'flash_alert')
  s.text == 'Invalid email or password.' ? tc_04_1.push('passed') : tc_04_1.push('failed')
  b.quit
end
puts "tc_04_1 : #{tc_04_1} "

# tc_04_2
f = Selenium::WebDriver.for :firefox
ie = Selenium::WebDriver.for :ie
c = Selenium::WebDriver.for :chrome
c.manage.window.maximize
tc_04_2 = []

[f, c, ie].each do |b|
  b.get 'http://demoapp.strongqa.com'
  b.find_element(:xpath, "//a[contains(text(), 'Login')]").click
  b.find_element(:id, 'user_password').send_keys 'test_password'
  b.find_element(:name, 'commit').click
  s = b.find_element(:id, 'flash_alert')
  s.text == 'Invalid email or password.' ? tc_04_2.push('passed') : tc_04_2.push('failed')
  b.quit
end
puts "tc_04_2 : #{tc_04_2} "

# tc_04_3
f = Selenium::WebDriver.for :firefox
ie = Selenium::WebDriver.for :ie
c = Selenium::WebDriver.for :chrome
c.manage.window.maximize
tc_04_3 = []

[f, c, ie].each do |b|
  b.get 'http://demoapp.strongqa.com'
  b.find_element(:xpath, "//a[contains(text(), 'Login')]").click
  b.find_element(:name, 'commit').click
  s = b.find_element(:id, 'flash_alert')
  s.text == 'Invalid email or password.' ? tc_04_3.push('passed') : tc_04_3.push('failed')
  b.quit
end
puts "tc_04_3 : #{tc_04_3} "

# tc_05_1
f = Selenium::WebDriver.for :firefox
ie = Selenium::WebDriver.for :ie
c = Selenium::WebDriver.for :chrome
c.manage.window.maximize
tc_05_1 = []

[f, c, ie].each do |b|
  b.get 'http://demoapp.strongqa.com'
  b.find_element(:xpath, "//a[contains(text(), 'Login')]").click
  b.find_element(:id, 'user_email').send_keys 'incorrect_mail@gmail.com'
  b.find_element(:id, 'user_password').send_keys 'test_password'
  b.find_element(:name, 'commit').click
  s = b.find_element(:id, 'flash_alert')
  s.text == 'Invalid email or password.' ? tc_05_1.push('passed') : tc_05_1.push('failed')
  b.quit
end
puts "tc_05_1 : #{tc_05_1} "

# tc_05_2
f = Selenium::WebDriver.for :firefox
ie = Selenium::WebDriver.for :ie
c = Selenium::WebDriver.for :chrome
c.manage.window.maximize
tc_05_2 = []

[f, c, ie].each do |b|
  b.get 'http://demoapp.strongqa.com'
  b.find_element(:xpath, "//a[contains(text(), 'Login')]").click
  b.find_element(:id, 'user_email').send_keys 'su160985pev@gmail.com'
  b.find_element(:id, 'user_password').send_keys 'incorrect_password'
  b.find_element(:name, 'commit').click
  s = b.find_element(:id, 'flash_alert')
  s.text == 'Invalid email or password.' ? tc_05_2.push('passed') : tc_05_2.push('failed')
  b.quit
end
puts "tc_05_2 : #{tc_05_2} "

# tc_05_3
f = Selenium::WebDriver.for :firefox
ie = Selenium::WebDriver.for :ie
c = Selenium::WebDriver.for :chrome
c.manage.window.maximize
tc_05_3 = []

[f, c, ie].each do |b|
  b.get 'http://demoapp.strongqa.com'
  b.find_element(:xpath, "//a[contains(text(), 'Login')]").click
  b.find_element(:id, 'user_email').send_keys 'incorrect_mail@gmail.com'
  b.find_element(:id, 'user_password').send_keys 'incorrect_password'
  b.find_element(:name, 'commit').click
  s = b.find_element(:id, 'flash_alert')
  s.text == 'Invalid email or password.' ? tc_05_3.push('passed') : tc_05_3.push('failed')
  b.quit
end
puts "tc_05_3 : #{tc_05_3} "
