class Users < ActiveRecord::Migration[8.0]
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.string :email, null: false
      t.string :password_digest, null: false
      t.string :role, default: "student", null: false
      t.timestamps
    end

    # Make unique index for email column
    add_index :users, :email, unique: true
  end
end
