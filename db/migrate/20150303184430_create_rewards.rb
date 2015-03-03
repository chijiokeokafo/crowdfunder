class CreateRewards < ActiveRecord::Migration
  def change
    create_table :rewards do |t|
    	t.string :description
    	t.integer :amount
    	t.integer :backer_limit
    	t.integer :project_id
    	t.integer :name
    	t.datetime :created_at
    	t.datetime :updated_at


      t.timestamps null: false
    end
  end
end
