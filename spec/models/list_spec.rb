require 'rails_helper'

RSpec.describe List, type: :model do
  it 'requires a title' do
    list1 = List.create(description: "something")
    list2 = List.create(title: '', description: "something")
    list3 = List.create!(title: 'Ballin', description: "everyday")

    expect(list1).not_to be_valid
    expect(list2).not_to be_valid
    expect(list3).to be_valid
  end

  it 'requires a description' do
    list1 = List.create(title: "finish school")
    list2 = List.create(title: '', description: "something")
    list3 = List.create!(title: 'Ballin', description: "everyday")

    expect(list1).not_to be_valid
    expect(list2).not_to be_valid
    expect(list3).to be_valid
  end

end
