class CreatePledges < ActiveRecord::Migration
  def change
    create_table :pledges do |t|
    	t.integer :amount
    	t.integer :backer_id
    	t.integer :project_id
    	t.datetime :created_at
    	t.datetime :updated_at

      t.timestamps null: false
    end
  end
end
