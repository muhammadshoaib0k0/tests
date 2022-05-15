class User < ApplicationRecord
  has_many :collaborations, dependent: :destroy
  has_many :repositories, dependent: :destroy
  has_many :shared_repositories, through: :collaborations, source: :repository

  validates :email, presence: true
  # validates :email,
  # format: { with: /^(.+)@(.+)$/, message: "Email invalid"  },
  #           uniqueness: { case_sensitive: false },
  #           length: { minimum: 4, maximum: 254 }

  validates :first_name, presence: true, length: { in: 2..15 }
  validates :last_name, presence: true, length: { in: 2..15 }
  def full_name
    "#{first_name} #{last_name}"
  end
end
