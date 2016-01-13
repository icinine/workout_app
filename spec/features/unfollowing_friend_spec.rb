require "rails_helper"

RSpec.feature "Unfollowing friends" do
  
  before do
    @john = User.create(first_name: "john", last_name: "Doe", email: "jojn@gmails.com", password: "password")
    @sara = User.create(first_name: "Sara", last_name: "Jones", email: "jonsing@gmails.com", password: "password")
    login_as(@john)
    
    @following = friendship.create(user: @john, friend: @sara)
    
  end
  
  scenatio do
    
    visit "/"
    click_link "My Lounge"
    link = "a[href='/friendships/#{@following.id}'][data-method='delete']"
    find(link).click
    
    expect(page).to have_content(@sarah.full_name + " unfollowed")
  end
end