class Courses < ActiveRecord::Migration[8.0]
  def change
    create_table :courses do |t|

      t.string :name, null: false
      t.string :semester, null: false
      t.references :instructor, null: false, foreign_key: { to_table: :users }
      t.timestamps
    end
  end
end
