class User < ActiveRecord::Base
  authenticates_with_sorcery!

  has_many :owned_projects, class_name: 'Project', foreign_key: 'owner_id'
  has_many :pledges, foreign_key: 'backer_id'
  has_many :rewards, through: :pledges, source: :backer
  has_many :projects, through: :pledges


  validates :password, length: { minimum: 8 }
  validates :password, confirmation: true
  validates :email, uniqueness: true
end