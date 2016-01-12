require 'rails_helper'

RSpec.feature "Listing exercises" do
  before do
    @john = User.create(first_name: "Bob", last_name: "Doe", email: "john@examples.com", password: "password")
    @sara = User.create(first_name: "Sara", last_name: "Doe", email: "sara@examples.com", password: "password")
    login_as(@john)
    
    @e1 = @john.exercises.create(duration_in_min: 50, workout: "Squats" , workout_date: Date.today) 
    @e2 = @john.exercises.create(duration_in_min: 60, workout: "Cardio", workout_date: Date.today) 
 
    @following = Friendship.create(user: @john, friend: @sara)
  
  end
  
  scenario "shows users workouts for last 7 days" do
    
    visit "/"
    click_link "My Lounge"
    
    expect(page).to have_content(@e1.duration_in_min)
    expect(page).to have_content(@e1.workout)
    expect(page).to have_content(@e1.workout_date)
    expect(page).to have_content(@e2.duration_in_min)
    expect(page).to have_content(@e2.workout)
    expect(page).to have_content(@e2.workout_date)
    
  end
  
  
  scenario "shows a list of users friends" do
    visit "/"
    
    click_link "My Lounge"
    expect(page).to have_content("My Friends")
    expect(page).to have_link(@sara.full_name)
    expect(page).to have_link("Unfollow")
    
    
  end
end