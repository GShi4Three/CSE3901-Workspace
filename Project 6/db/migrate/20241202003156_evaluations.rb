class Evaluations < ActiveRecord::Migration[8.0]
  def change
    create_table :evaluations do |t|
      t.references :presentation, null: false, foreign_key: true
      t.references :evaluator, null: false, foreign_key: { to_table :users}

      t.integer :content_score, null: false
      t.integer :organization_score, null: false
      t.integer :pacing_score, null: false
      t.integer :professionalism_score, null: false
      t.integer: total_score, null: false

      t.text :comment
      t.timestamps
    end
  end
end
