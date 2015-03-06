class Project < ActiveRecord::Base
  has_many :rewards
  has_many :pledges
  has_many :backers, through: :pledges, class_name: 'User'
  belongs_to :owner, class_name: 'User'
  accepts_nested_attributes_for :rewards

  def amount_raised
  	sum = 0
  	pledges.each do |pledge|
  		sum = sum + pledge.amount
  	end
  	return sum
  end

  def project_funded
  end


  



  def self.available_categories
  	%w(Music Games Household Video Art Outdoors Technology Food Sports Clothing Automotive Lifehack Business )
  end
end