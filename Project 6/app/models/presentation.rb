class Presentation < ApplicationRecord
  # Associations
  has_many :evaluations, dependent: :destroy
  has_and_belongs_to_many :users, join_table: :presentation_creators
end
