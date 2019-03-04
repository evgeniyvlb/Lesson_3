require 'watir'
require 'webdrivers'

# tc01
f = Watir::Browser.new :firefox
ie = Watir::Browser.new :ie
c = Watir::Browser.new :chrome
c.window.maximize
tc01 = []
[f, c, ie].each do |b|
  b.goto 'http://demoapp.strongqa.com'
  b.link(text: 'Login').click
  b.title == 'Demo web application - Login form' ? tc01.push('passed') : tc01.push('failed')
  b.close
end
puts "tc01 : #{tc01} "

# tc02
f = Watir::Browser.new :firefox
ie = Watir::Browser.new :ie, :ignore_protected_mode_settings => true
c = Watir::Browser.new :chrome
c.window.maximize
tc02 = []
[f, c, ie].each do |b|
  b.goto 'http://demoapp.strongqa.com'
  b.link(text: 'Login').click
  b.text_field(id: 'user_email').set('su160985pev@gmail.com')
  b.text_field(id: 'user_password').set('test_password')
  b.button(value: 'Log in').click
  b.title == 'Demo web application - Home' ? tc02.push('passed') : tc02.push('failed')
  b.close
end
puts "tc02 : #{tc02} "

# tc03_1
f = Watir::Browser.new :firefox
ie = Watir::Browser.new :ie
c = Watir::Browser.new :chrome
c.window.maximize
tc03_1 = []
[f, c, ie].each do |b|
  b.goto 'http://demoapp.strongqa.com'
  b.link(text: 'Login').click
  b.text_field(id: 'user_email').set('su160985pev@gmail.com')
  b.text_field(id: 'user_password').set('test_password')
  b.label(for: 'user_remember_me').click
  b.button(value: 'Log in').click
  b.title == 'Demo web application - Home' ? tc03_1.push('passed') : tc03_1.push('failed')
  b.close
end
puts "tc03_1 : #{tc03_1} "

# tc03_2
f = Watir::Browser.new :firefox
ie = Watir::Browser.new :ie
c = Watir::Browser.new :chrome
c.window.maximize
tc03_2 = []
[f, c, ie].each do |b|
  b = Watir::Browser.new :firefox
  b.goto 'http://demoapp.strongqa.com'
  b.link(text: 'Logout').exist? ? tc03_2.push('passed') : tc03_2.push('failed')
end
puts "tc03_2 : #{tc03_2} "

# tc03_3
f = Watir::Browser.new :firefox
c = Watir::Browser.new :chrome
c.window.maximize
tc03_3 = []

[f, c, ie].each do |b|
  b.goto 'http://demoapp.strongqa.com'
  if b.link(text: 'Logout').exist?
    b.link(text: 'Logout').click
    b.close
  else b.close
  end
end

f = Watir::Browser.new :firefox
c = Watir::Browser.new :chrome
c.window.maximize
[f, c, ie].each do |b|
  b.goto 'http://demoapp.strongqa.com'
  b.link(text: 'Logout').exist? ? tc03_3.push('failed') : tc03_3.push('passed')
  b.close
end
puts "tc03_3 : #{tc03_3} "

# tc04_1
f = Watir::Browser.new :firefox
ie = Watir::Browser.new :ie
c = Watir::Browser.new :chrome
c.window.maximize
tc04_1 = []
[f, c, ie].each do |b|
  b.goto 'http://demoapp.strongqa.com'
  b.link(text: 'Login').click
  b.text_field(id: 'user_email').set('su160985pev@gmail.com')
  b.button(value: 'Log in').click
  s = b.span id: 'flash_alert'
  s.text == 'Invalid email or password.' ? tc04_1.push('passed') : tc04_1.push('failed')
  b.close
end
puts "tc04_1 : #{tc04_1} "

# tc04_2
f = Watir::Browser.new :firefox
ie = Watir::Browser.new :ie
c = Watir::Browser.new :chrome
c.window.maximize
tc04_2 = []
[f, c, ie].each do |b|
  b.goto 'http://demoapp.strongqa.com'
  b.link(text: 'Login').click
  b.text_field(id: 'user_password').set('test_password')
  b.button(value: 'Log in').click
  s = b.span id: 'flash_alert'
  if s.text == 'Invalid email or password.' && b.button(value: 'Log in').exist?
    tc04_2.push('passed')
  else tc04_2.push('failed')
  end
  b.close
end
puts "tc04_2 : #{tc04_2} "

# tc04_3
f = Watir::Browser.new :firefox
ie = Watir::Browser.new :ie
c = Watir::Browser.new :chrome
c.window.maximize
tc04_3 = []
[f, c, ie].each do |b|
  b.goto 'http://demoapp.strongqa.com'
  b.link(text: 'Login').click
  b.button(value: 'Log in').click
  s = b.span id: 'flash_alert'
  if s.text == 'Invalid email or password.' && b.button(value: 'Log in').exist?
    tc04_3.push('passed')
  else tc04_3.push('failed')
  end
  b.close
end
puts "tc04_3 : #{tc04_3} "

# tc05_1
f = Watir::Browser.new :firefox
ie = Watir::Browser.new :ie
c = Watir::Browser.new :chrome
c.window.maximize
tc05_1 = []
[f, c, ie].each do |b|
  b.goto 'http://demoapp.strongqa.com'
  b.link(text: 'Login').click
  b.text_field(id: 'user_email').set('incorrect_mail@gmail.com')
  b.text_field(id: 'user_password').set('test_password')
  b.button(value: 'Log in').click
  s = b.span id: 'flash_alert'
  if s.text == 'Invalid email or password.' && b.button(value: 'Log in').exist?
    tc05_1.push('passed')
  else tc05_1.push('failed')
  end
  b.close
end
puts "tc05_1 : #{tc05_1} "

# tc05_2
f = Watir::Browser.new :firefox
ie = Watir::Browser.new :ie
c = Watir::Browser.new :chrome
c.window.maximize
tc05_2 = []
[f, c, ie].each do |b|
  b.goto 'http://demoapp.strongqa.com'
  b.link(text: 'Login').click
  b.text_field(id: 'user_email').set('su160985pev@gmail.com')
  b.text_field(id: 'user_password').set('incorrect_password')
  b.button(value: 'Log in').click
  s = b.span id: 'flash_alert'
  if s.text == 'Invalid email or password.' && b.button(value: 'Log in').exist?
    tc05_2.push('passed')
  else tc05_2.push('failed')
  end
  b.close
end
puts "tc05_2 : #{tc05_2} "

# tc05_3
f = Watir::Browser.new :firefox
ie = Watir::Browser.new :ie
c = Watir::Browser.new :chrome
c.window.maximize
tc05_3 = []
[f, c, ie].each do |b|
  b.goto 'http://demoapp.strongqa.com'
  b.link(text: 'Login').click
  b.text_field(id: 'user_email').set('incorrect_mail@gmail.com')
  b.text_field(id: 'user_password').set('incorrect_password')
  b.button(value: 'Log in').click
  s = b.span id: 'flash_alert'
  if s.text == 'Invalid email or password.' && b.button(value: 'Log in').exist?
    tc05_3.push('passed')
  else tc05_3.push('failed')
  end
  b.close
end
puts "tc05_3 : #{tc05_3}"
