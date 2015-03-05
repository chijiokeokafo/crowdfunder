class Project < ActiveRecord::Base
  has_many :rewards
  has_many :pledges
  has_many :backers, through: :pledges, class_name: 'User'
  belongs_to :owner, class_name: 'User'

  def amount_raised
  	sum = 0
  	pledges.each do |pledge|
  		sum = sum + pledge.amount
  	end
  	return sum
  end

  def self.available_categories
  	%w(Music Games Household Video Art Outdoors Technology Food )
  end
end