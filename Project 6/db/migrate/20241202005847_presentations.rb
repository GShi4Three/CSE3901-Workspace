class Presentations < ActiveRecord::Migration[8.0]
  def change
    create_table :presentations do |t|:
      t.string :title, null: false
      t.text :description
      t.datetime :date
      t.references :created_by, null: false, foreign_key: {to_table: users}
      t.timestamps
  end
end
