class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :title
      t.string :notes
      t.integer :status, default: 0
      t.date :start_date
      t.date :due_date
      t.attachment :file
      t.references :list, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
