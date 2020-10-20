require 'rails_helper'

RSpec.feature "UserLogins", type: :feature, js: true do
  before :each do
    @user = User.create!(name: 'Vlad', email: 'q@q.com', password: '1234', password_confirmation: '1234')
  end

  scenario "They can login" do
    visit '/login'

    fill_in "Email", with: @user.email
    fill_in "Password", with: @user.password
    click_button "LogIn"

    expect(page).to have_content("Welcome #{@user.name}")

    click_link 'Logout'

    expect(page).to have_content("Login")

    save_screenshot
  end
end
