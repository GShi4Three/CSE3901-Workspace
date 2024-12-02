class Rosters < ActiveRecord::Migration[8.0]
  def change
    create_table :rosters do |t|:
      t.references :user, null: false, foreign_key: true
      t.references :course, null: false, foreign_key: true
      t.datetime :enrolled_on, null: false
      t.datetime :dropped_on
      t.timestamps
    end
  end
end
