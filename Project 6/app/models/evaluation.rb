class Evaluation < ApplicationRecord
  # Associations
  belongs_to :user
  belongs_to :presentation

  validates :content_score, :organization_score, :time_pacing_score, :professionalism_score, presence: true, inclusion: { in: 1..10 }
  validates :comments, presence: true
  validates :user_id, uniqueness: { scope: :presentation_id, message: "has already submitted an evaluation for this presentation" }
end
