require "rails_helper"

RSpec.feature "Users signin" do
  before do
  @bob = User.create!(first_name: "Bob", last_name: "Doe", email: "bob@example.com", password: "password")
  end
 
  scenario "with valid credentials" do
    visit "/"
    click_link "Sign in"
    
    fill_in "Email", with: @bob.email
    fill_in "Password", with: @bob.password
    click_button "Log in"
    
    expect(page).to have_content("Signed in successfully")
    expect(page).to have_content("Signed in as #{@bob.email}")
    
    end
end