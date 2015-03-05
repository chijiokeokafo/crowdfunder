class Pledge < ActiveRecord::Base
  belongs_to :backer, class_name: 'User', foreign_key: 'backer_id'
  belongs_to :project

  # validates :amount, presence: true
  validates :amount, numericality: { greater_than: 0, only_integer: true }

end
	