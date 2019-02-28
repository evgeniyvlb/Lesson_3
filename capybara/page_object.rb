require 'site_prism'

FailedObjectConversion = Class.new(StandardError)

class LoginSection < SitePrism::Section
  element :useremail, '#user_email'
  element :password, '#user_password'
  element :loginbutton, 'input[name="commit"]'

  element :rememberme, :xpath, '//label[@for="user_remember_me"]'
end

class Home < SitePrism::Page
  set_url 'http://demoapp.strongqa.com'

  element :login_btn, :xpath, '//a[contains(text(), "Login")]'
  element :logout_btn, :xpath, '//a[contains(text(), "Logout")]'
  element :flash_alert, '#flash_alert'
  section :loginsection, LoginSection, '.authform'

  def set_useremail(useremail)
    loginsection.useremail.set useremail
  end

  def set_password(password)
    loginsection.password.set password
    end

  def find_alert(has_element, alert_element, tc)
    if has_element
      if alert_element.text == 'Invalid email or password.'
        puts "#{tc} : passed"
      else
        puts "#{tc} : failed"
      end
    else
      puts "#{tc} : failed2"
    end
  end

  def find_logout_btn(has_element, tc)
    if has_element
      puts "#{tc} : passed"
    else
      puts "#{tc} : failed"
     end
    end
end
