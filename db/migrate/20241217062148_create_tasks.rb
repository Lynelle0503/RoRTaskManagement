class CreateTasks < ActiveRecord::Migration[8.0]
  def change
    create_table :tasks do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name
      t.text :body
      t.datetime :due
      t.boolean :done
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
    #add_foreign_key :tasks, :users, column: :user
    #add_foreign_key :tasks, :categories, column: :category
  end
end
