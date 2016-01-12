require "rails_helper"

RSpec.feature "Following friends" do
  
  before do
    @john = User.create(first_name:"John", last_name:"Doe", email:"john@gmail.com", password:"password")
    @bob = User.create(first_name:"Shane", last_name:"Piss", email:"piss@gmail.com", password:"password")
    login_as(@john)
  end
  
  scenario "if signed in succeeds" do
    visit "/"
    
    expect(page).to have_content(@john.full_name)
    expect(page).to have_content(@bob.full_name)
    expect(page).not_to have_link("Follow", :href => "/friendships?friend_id=#{@john.id}")
    
    link = "a[href='/friendships?friend_id=#{@bob.id}']"
    find(link).click
    
    expect(page).not_to have_link("Follow", :href => "/friendships?friend_id=#{@bob.id}")
  end
  
end
