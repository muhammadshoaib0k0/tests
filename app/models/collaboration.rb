class Collaboration < ApplicationRecord
  belongs_to :repository
  belongs_to :collaborator, class_name: 'User', foreign_key: 'user_id'
end
