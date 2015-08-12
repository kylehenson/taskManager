require 'rails_helper'

RSpec.describe Task, type: :model do
  it 'requires a title' do
    task1 = Task.create(notes: 'cool', status: 'incomplete', start_date: '2016, 31, 01', due_date: '2015, 28, 02')
    task2 = Task.create(title: '', notes: 'cool', status: 'incomplete', start_date: '2016, 31, 01', due_date: '2015, 28, 02')
    task3 = Task.create!(title: 'Ballin', notes: 'cool', status: 'complete', start_date: '2016, 31, 01', due_date: '2015, 28, 02')

    expect(task1).not_to be_valid
    expect(task2).not_to be_valid
    expect(task3).to be_valid
  end

  it 'is created with a status of incomplete' do
    task = Task.create!(title: 'hiking', notes: 'cool', start_date: '2016, 31, 01', due_date: '2015, 28, 02')

    expect(task.status).to eq('incomplete')
  end

  it 'does not allow the user to create a task with a start_date before the current date' do
    task = Task.create(title: 'hiking', notes: 'cool', start_date: Date.new(2015, 01, 31))
    task1 = Task.create(title: 'hiking', notes: 'cool', start_date: Date.new(2015, 9, 30))

    expect(task).not_to be_valid
    expect(task.errors.messages[:start_date][0]).to eq("can't be in the past")

    expect(task1).to be_valid
    expect(task1.start_date.to_s).to eq "2015-09-30"
  end

  it 'does not allow the user to create a task with a due_date before the current date' do
    task = Task.create(title: 'hiking', notes: 'cool', due_date: Date.new(2015, 01, 31))
    task1 = Task.create(title: 'hiking', notes: 'cool', due_date: Date.new(2015, 9, 30))

    expect(task).not_to be_valid
    expect(task.errors.messages[:due_date][0]).to eq("can't be in the past")

    expect(task1).to be_valid
    expect(task1.due_date.to_s).to eq "2015-09-30"
  end

  it 'filters tasks before current date and after' do
    task = Task.create(title: 'hiking', notes: 'cool', start_date: Date.new(2015, 01, 31))
    task1 = Task.create(title: 'hiking', notes: 'cool', start_date: Date.new(2015, 9, 1))

    expect(task.before_today_and_incomplete?).to eq true
    expect(task1.before_today_and_incomplete?).to eq false
  end
end
