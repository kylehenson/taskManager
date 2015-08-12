require 'rails_helper'

RSpec.describe "task creation", type: :feature do
  it "can create a task" do
    visit root_path
    click_link_or_button "Create a list"
    fill_in 'Title', with: "Burritos"
    fill_in 'Description', with: "yum"
    click_link_or_button "Submit"

    expect(page).to have_content("Burritos")

    click_link_or_button "Burritos"
    click_link_or_button "Add Task"

    expect(page).to have_content "Create New Task:"

    fill_in 'Title', with: "Chipotle"
    fill_in 'Notes', with: "ok"
    fill_in 'Start date', with: Date.new(2015, 8, 12)
    fill_in 'Due date', with: Date.new(2015, 8, 31)
    click_link_or_button "Submit"

    expect(current_path).not_to eq lists_path

    expect(page).to have_content("Burritos")
    expect(page).to have_content("yum")
    expect(page).to have_content("Chipotle")
    expect(page).to have_content("ok")
    expect(page).to have_content("2015-08-12")
    expect(page).to have_content("2015-08-31")
  end

  it "can not create a task with invalid attributes" do
    visit root_path
    click_link_or_button "Create a list"
    fill_in 'Title', with: "Burritos"
    fill_in 'Description', with: "yum"
    click_link_or_button "Submit"

    expect(page).to have_content("Burritos")

    click_link_or_button "Burritos"
    click_link_or_button "Add Task"

    expect(page).to have_content "Create New Task:"

    fill_in 'Title', with: ""
    click_link_or_button "Submit"
    expect(page).to have_content("Title can't be blank")
  end

  it "can not create a task with a start date before today" do
    visit root_path
    click_link_or_button "Create a list"
    fill_in 'Title', with: "Burritos"
    fill_in 'Description', with: "yum"
    click_link_or_button "Submit"

    click_link_or_button "Burritos"
    click_link_or_button "Add Task"

    fill_in 'Title', with: "Chipotle"
    fill_in 'Notes', with: "ok"
    fill_in 'Start date', with: Date.new(2015, 8, 10)
    fill_in 'Due date', with: Date.new(2015, 8, 31)
    click_link_or_button "Submit"

    expect(page).to have_content "Start date can't be in the past"
  end

  it "can not create a task with a due date before today" do
    visit root_path
    click_link_or_button "Create a list"
    fill_in 'Title', with: "Burritos"
    fill_in 'Description', with: "yum"
    click_link_or_button "Submit"

    click_link_or_button "Burritos"
    click_link_or_button "Add Task"

    fill_in 'Title', with: "Chipotle"
    fill_in 'Notes', with: "ok"
    fill_in 'Start date', with: Date.new(2015, 8, 12)
    fill_in 'Due date', with: Date.new(2015, 8, 10)
    click_link_or_button "Submit"

    expect(page).to have_content "Due date can't be in the past"
  end

  xit 'creates a task but does not display it unless the start date is prior to current date' do
    visit root_path
    click_link_or_button "Create a list"
    fill_in 'Title', with: "Burritos"
    fill_in 'Description', with: "yum"
    click_link_or_button "Submit"
    click_link_or_button "Burritos"
    click_link_or_button "Add Task"
    fill_in 'Title', with: "Chipotle"
    fill_in 'Start date', with: Date.new(2015, 8, 12)
    click_link_or_button "Submit"

    expect(page).to_not have_content "Chipotle"
  end
end
