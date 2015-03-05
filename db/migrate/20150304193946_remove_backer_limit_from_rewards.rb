class RemoveBackerLimitFromRewards < ActiveRecord::Migration
  def change
  	remove_column :rewards, :backer_limit
  end
end
