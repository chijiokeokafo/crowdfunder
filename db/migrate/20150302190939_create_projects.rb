class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :title
      t.text :description
      t.integer :funding_goal
      t.date :start_date
      t.date :end_date
      t.string :category

      t.timestamps null: false
    end
  end
end
