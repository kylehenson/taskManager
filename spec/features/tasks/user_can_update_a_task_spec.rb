require 'rails_helper'

RSpec.describe "task update", type: :feature do
  before(:each) do
    @list = List.create!(title: "Burritos", description: "yum")
    @task = @list.tasks.create!(title: "Chipotle", notes: "ok", start_date: Date.new(2015, 8, 12), due_date: Date.new(2015, 8, 31))
  end

  it 'can update a task with valid attributes' do
    visit root_path
    click_link_or_button @list.title

    expect(page).to have_content("Burritos")
    expect(page).to have_content("yum")
    expect(page).to have_content("Chipotle")
    expect(page).to have_content("ok")
    expect(page).to have_content("2015-08-12")
    expect(page).to have_content("2015-08-31")

    click_link_or_button @task.title

    expect(page).to have_content "Edit Your Task:"

    fill_in 'Title', with: "Cookies"
    fill_in 'Notes', with: "yes"
    fill_in 'Start date', with: Date.new(2015, 9, 12)
    fill_in 'Due date', with: Date.new(2015, 9, 30)
    click_link_or_button "Submit"

    expect(current_path).to eq list_path(@list)
    expect(page).to have_content "Cookies"
    expect(page).to have_content "yes"
    expect(page).to have_content("2015-09-12")
    expect(page).to have_content("2015-09-30")
  end

  it 'can not update a task with invalid attributes' do
    visit root_path
    click_link_or_button @list.title

    expect(page).to have_content("Burritos")
    expect(page).to have_content("yum")
    expect(page).to have_content("Chipotle")
    expect(page).to have_content("ok")
    expect(page).to have_content("2015-08-12")
    expect(page).to have_content("2015-08-31")

    click_link_or_button @task.title

    expect(page).to have_content "Edit Your Task:"

    fill_in 'Title', with: ""
    fill_in 'Notes', with: "yes"
    fill_in 'Start date', with: Date.new(2015, 9, 12)
    fill_in 'Due date', with: Date.new(2015, 9, 30)
    click_link_or_button "Submit"

    expect(page).to have_content("Title can't be blank")
  end

end
