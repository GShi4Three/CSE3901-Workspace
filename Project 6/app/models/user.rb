class User < ApplicationRecord
  has_secure_password

  # Associations
  has_many :evaluations
  has_and_belongs_to_many :presentations, join_table: :presentation_creators
end
