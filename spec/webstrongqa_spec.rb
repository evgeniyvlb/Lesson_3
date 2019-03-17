require_relative '../lib/webstrongqa.rb'

RSpec.describe "webstrongqa" do
let(:home_page) {Home.new}
  describe "test webstrongqa" do
    #let(:home_page) {Home.new}
    it "should open login page tc_01" do
      home_page.load
      home_page.login_btn.click
      expect(home_page.title).to eq('Demo web application - Login form')
	end

    it "should be authorized on login page tc_02" do
      home_page.load
      home_page.login_btn.click
	    home_page.set_user_email('su160985pev@gmail.com')
      home_page.set_password('test_password')
      home_page.login_section.login_button.click
      expect(home_page).to have_logout_btn
	    Capybara.reset_sessions!
    end

	  it "should be authorized and remembered on login page tc_03_1" do
      home_page.load
      home_page.login_btn.click
	    home_page.set_user_email('su160985pev@gmail.com')
      home_page.set_password('test_password')
	    home_page.login_section.remember_me.click
      home_page.login_section.login_button.click
      expect(home_page).to have_logout_btn
    end

	  it "should be already authorized tc_03_2" do
      home_page.load
      expect(home_page).to have_logout_btn
	    Capybara.reset_sessions!
    end
#issue not_to
	  it "should not be authorized tc_03_3" do
      home_page.load
      expect(home_page).to have_no_logout_btn
	    Capybara.reset_sessions!
    end

	  it "should get an alert with empty password tc_04_1" do
      home_page.load
      home_page.login_btn.click
	    home_page.set_user_email('su160985pev@gmail.com')
      home_page.login_section.login_button.click
      expect(home_page).to have_flash_alert
	    expect(home_page.flash_alert.text).to eq('Invalid email or password.')
    end

	  it "should get an alert with empty email tc_04_2" do
      home_page.load
      home_page.login_btn.click
  	  home_page.set_password('test_password')
      home_page.login_section.login_button.click
      expect(home_page).to have_flash_alert
	    expect(home_page.flash_alert.text).to eq('Invalid email or password.')
    end

	  it "should get an alert with empty email & password tc_04_3" do
      home_page.load
      home_page.login_btn.click
	    home_page.login_section.login_button.click
      expect(home_page).to have_flash_alert
	    expect(home_page.flash_alert.text).to eq('Invalid email or password.')
    end

	  it "should get an alert with incorrect email tc_05_1" do
      home_page.load
      home_page.login_btn.click
	    home_page.set_user_email('incorrect_mail@gmail.com')
      home_page.set_password('test_password')
	    home_page.login_section.login_button.click
      expect(home_page).to have_flash_alert
	    expect(home_page.flash_alert.text).to eq('Invalid email or password.')
    end

	  it "should get an alert with incorrect password tc_05_2" do
      home_page.load
      home_page.login_btn.click
	    home_page.set_user_email('su160985pev@gmail.com')
      home_page.set_password('incorrect_password')
	    home_page.login_section.login_button.click
      expect(home_page).to have_flash_alert
	    expect(home_page.flash_alert.text).to eq('Invalid email or password.')
    end

	  it "should get an alert with incorrect email & password tc_05_3" do
      home_page.load
      home_page.login_btn.click
	    home_page.set_user_email('incorrect@gmail.com')
      home_page.set_password('incorrect_password')
	    home_page.login_section.login_button.click
      expect(home_page).to have_flash_alert
	    expect(home_page.flash_alert.text).to eq('Invalid email or password.')
    end
  end
end
