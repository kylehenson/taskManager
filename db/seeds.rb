class Seed

  def self.go
    Rails.env == "production" ? production : development
  end

  def self.production
    generate_lists
    generate_tasks
  end

  def self.development
    generate_lists
    generate_tasks
  end

  def self.generate_tasks
    10.times do |i|
      p "task #{i} generated"
      Task.create!(title: "Task#{i}",
                   notes: "notes#{i}",
                   due_date: Date.new(2015, 9, 1),
                   start_date: Date.new(2015, 9, 1),
                   list_id: random_list_id)
    end
    5.times do |i|
      p "task #{i} generated"
      Task.create!(title: "Task#{i}",
                   notes: "notes#{i}",
                   due_date: Date.new(2014, 9, 1),
                   start_date: Date.new(2014, 9, 1),
                   list_id: random_list_id)
    end
  end

  def self.generate_lists
    5.times do |i|
      p "list #{i} generated"
      List.create!(title: "Title#{i}",
                   description: "Description#{i}")
    end
  end

  private

  def self.all_lists
    List.all
  end

  def self.random_list_id
    all_lists.sample.id
  end

end

Seed.go
