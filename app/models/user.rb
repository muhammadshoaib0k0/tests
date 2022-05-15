class User < ApplicationRecord
  has_many :collaborations, dependent: :destroy
  has_many :repositories, dependent: :destroy
  has_many :shared_repositories, through: :collaborations, source: :repository
end
