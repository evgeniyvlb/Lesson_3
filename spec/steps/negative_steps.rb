module NegativeSteps

# WHEN
  step 'I fill incorrect email field' do
    @home_page.set_user_email('incorrect_mail@gmail.com')
  end

  step 'I fill incorrect password field' do
    @home_page.set_password('incorrect_password')
  end

# THEN
  step 'I get an error of incorrect email or password' do
    expect(@home_page).to have_flash_alert
    expect(@home_page.flash_alert.text).to eq('Invalid email or password.')
  end
end

RSpec.configure { |c| c.include NegativeSteps, negative_steps: true }
