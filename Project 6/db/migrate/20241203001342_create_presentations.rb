class CreatePresentations < ActiveRecord::Migration[8.0]
  def change
    create_table :presentations do |t|
      t.string :name
      t.string :image
      t.float :score

      t.timestamps
    end
  end
end
