class Project < ActiveRecord::Base
  has_many :rewards
  has_many :pledges
  has_many :backers, through: :pledges, class_name: 'User'
  belongs_to :owner, class_name: 'User'
  accepts_nested_attributes_for :rewards 	

  validates :title, :description, :funding_goal, :start_date, :end_date, presence: true
  validates :funding_goal, numericality: { only_integer: true }


  def self.available_categories
  	%w(Music Games Household Video Art Outdoors Technology Food )
  end
end
