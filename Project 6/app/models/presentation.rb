class Presentation < ApplicationRecord
  # Associations
  has_many :evaluations
  has_and_belongs_to_many :users, join_table: :presentation_creators
end
