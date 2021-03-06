class CreateTodos < ActiveRecord::Migration[6.0]
  def change
    create_table :todos do |t|
      t.text :text
      t.boolean :isCompleted
      t.references :project, foreign_key: true

      t.timestamps
    end
  end
end
