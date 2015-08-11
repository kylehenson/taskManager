require 'rails_helper'

RSpec.describe "list delete" do
  it "can delete a list" do
    visit root_path
    click_link_or_button "Create a list"
    fill_in 'Title', with: "Run"
    fill_in 'Description', with: "fast"
    click_link_or_button "Submit"

    expect(page).to have_content("Run")
    expect(page).to have_content("fast")

    click_link_or_button "Delete"

    expect(current_path).to eq lists_path
    expect(page).not_to have_content("Shop")
    expect(page).not_to have_content("Groceries")
  end
end
