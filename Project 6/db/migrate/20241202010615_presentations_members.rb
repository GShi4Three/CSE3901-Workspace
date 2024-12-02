class PresentationsMembers < ActiveRecord::Migration[8.0]
  def change
    create_table :presentations_members do |t|:
      t.references :presentation, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
    end
  end
end
