class User < ApplicationRecord
  has_secure_password

  # Associations
  has_many :evaluations, dependent: :destroy
  has_and_belongs_to_many :presentations, join_table: :presentation_creators

  after_initialize :set_default_role, if: :new_record?

  private

  def set_default_role
    self.role ||= 'student'
  end
end
