require "rails_helper"

RSpec.feature "Listing Members" do
  
  before do
    @john = User.create(first_name:"John", last_name:"Doe", email: "john@examples.com", password: "password")
    @mary = User.create(first_name:"Mary", last_name:"Smith", email: "mary@examples.com", password: "password")
  end
  
  
  scenario "shows a list of registered members" do
    visit "/"
    expect(page).to have_content("List of Members")
    expect(page).to have_content(@john.full_name)
    expect(page).to have_content(@mary.full_name)
    
  end
  
  
end