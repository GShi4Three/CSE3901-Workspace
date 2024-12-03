class CreatePresentationCreators < ActiveRecord::Migration[8.0]
  def change
    create_table :presentation_creators do |t|
      t.references :presentation, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end