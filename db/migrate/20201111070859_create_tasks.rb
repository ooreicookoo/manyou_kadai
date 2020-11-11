class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.string :title
      t.text :content
      t.integer :priority
      t.integer :status
      t.date :limit
      
      t.timestamps
    end
  end
end
