require "rails_helper"

RSpec.feature "Signing out signed-in users" do
  
  before do
    @bob = User.create(first_name: "Bob", last_name: "Doe", email: "bob@example.com", password: "password")
    visit "/"
    click_link "Sign in"
    fill_in "Email", with:(@bob.email)
    fill_in "Password", with:(@bob.password)
    click_button "Log in"
  end
  
  scenario do
    visit "/"
    click_link "Sign out"
    expect(page).to have_content("Signed out successfully")
        
  end
  
end