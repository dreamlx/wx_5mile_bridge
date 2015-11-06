class CreateDoctors < ActiveRecord::Migration
  def change
    create_table :doctors do |t|
      t.string :username
      t.string :name
      t.string :grade
      t.string :avatar
      t.text :desc
      t.string :hospital
      t.string :department
      t.string :state
      t.string :password_digest

      t.timestamps null: false
    end
  end
end
