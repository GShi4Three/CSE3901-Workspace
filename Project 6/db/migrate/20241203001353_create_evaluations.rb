class CreateEvaluations < ActiveRecord::Migration[8.0]
  def change
    create_table :evaluations do |t|
      t.integer :content_score
      t.integer :organization_score
      t.integer :time_pacing_score
      t.integer :professionalism_score
      t.text :comments
      t.references :user, null: false, foreign_key: true
      t.references :presentation, null: false, foreign_key: true

      t.timestamps
    end
  end
end
