class Repository < ApplicationRecord
  belongs_to :owner, class_name: 'User', foreign_key: 'user_id'
  has_many :collaborations, dependent: :destroy
  has_many :users, through: :collaborations

  validates :name, presence: true, length: { in: 2..25 }
  validates :description, presence: true, length: { in: 2..95 }
end
