class User < ApplicationRecord
  has_many :collaborations, dependent: :destroy
  has_many :repositories, dependent: :destroy
  has_many :shared_repositories, through: :collaborations, source: :repository

  validates :email, presence: true

  validates :first_name, presence: true, length: { in: 2..15 }
  validates :last_name, presence: true, length: { in: 2..15 }

  def full_name
    "#{first_name} #{last_name}"
  end
end
