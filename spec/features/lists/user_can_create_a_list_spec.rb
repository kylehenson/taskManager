require 'rails_helper'

RSpec.describe "list creation" do
  it "can create a list" do
    visit root_path
    click_link_or_button "Create a list"
    fill_in 'Title', with: "Run"
    fill_in 'Description', with: "fast"
    click_link_or_button "Submit"

    expect(current_path).to eq lists_path
    expect(page).to have_content("Run")
  end

  xit "cannot be created with invalid inputs" do
    visit root_path
    click_link_or_button "Create a list"
    fill_in "Title", with: "Run"
    fill_in "Description", with: ""
    click_link_or_button "Submit"

    expect(page).to have_content("Invalid")
  end
end
