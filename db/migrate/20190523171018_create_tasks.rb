class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.string :title
      t.text :description
      t.boolean :urgent, default: false
      t.boolean :complete, default: false
      t.datetime :deadline_at
      t.references :project, foreign_key: true

      t.timestamps
    end
    add_index :tasks, :urgent, :complete
  end
end
