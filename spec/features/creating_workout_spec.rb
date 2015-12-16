require 'rails_helper'

RSpec.feature "Creating Workout" do
  
  before do
    @bob = User.create(email:"bob@example.com", password: "password")
    login_as(@bob)
  end
  
  scenario "with valid inputs" do
    visit "/"
    
    click_link "My Lounge"
    click_link "New Workout"
    expect(page).to have_link ("Back")
    
    fill_in "Duration", with: 70
    fill_in "Workout Details", with: "weight lifting"
    fill_in "Activity date", with: "2015-07-01"
    click_button "Create Workout"
    
    expect(page).to have_content("Workout has been created")
    
    exercise = Exercise.last
    expect(page.current_path).to eq(user_exercise_path(@bob, exercise))
  end
  
end