class Repository < ApplicationRecord
  belongs_to :owner, class_name: 'User', foreign_key: 'user_id'
  has_many :collaborations, dependent: :destroy
  has_many :users, through: :collaborations

  
end
