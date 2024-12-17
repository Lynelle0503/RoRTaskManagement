class CreateCategories < ActiveRecord::Migration[8.0]
  def change
    create_table :categories do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name

      t.timestamps
    end
    #add_foreign_key :categories, :users, column: :user
  end
end
