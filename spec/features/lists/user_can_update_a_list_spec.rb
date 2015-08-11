require 'rails_helper'

RSpec.describe "list edit" do
  context 'with valid attributes' do
    it "can update a list" do
      visit root_path
      click_link_or_button "Create a list"
      fill_in 'Title', with: "Run"
      fill_in 'Description', with: "fast"
      click_link_or_button "Submit"

      expect(page).to have_content("Run")

      click_link_or_button "Edit"

      fill_in 'Title', with: "Shop"
      fill_in 'Description', with: "Groceries"
      click_link_or_button "Submit"

      expect(current_path).to eq lists_path
      expect(page).to have_content("Shop")
      expect(page).to have_content("Groceries")
    end
  end
end
