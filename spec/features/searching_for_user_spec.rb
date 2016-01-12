require "rails_helper"

RSpec.feature "Searching for User" do
  
  before do
    @john = User.create(first_name:"John", last_name:"Doe", email: "john@examples.com", password: "password")
    @mary = User.create(first_name:"Mary", last_name:"Doe", email: "mary@examples.com", password: "password")
  end
  
  scenario "with existing name returns those users" do
    visit "/"
    fill_in "search_name", with: "Doe"
    click_button "Search"
    
    expect(page).to have_content(@john.full_name)
    expect(page).to have_content(@mary.full_name)
    
    expect(current_path).to eq("/dashboard/search")
  end
end