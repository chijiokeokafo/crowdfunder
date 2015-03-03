class PledgesController < ApplicationController
  belongs_to :backer, class_name: 'User'
  belongs_to :project
end
