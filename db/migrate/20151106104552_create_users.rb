class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :cell
      t.string :name
      t.text :address
      t.string :gender
      t.string :id_no
      t.string :card_no
      t.references :doctor, index: true, foreign_key: true
      t.string :password_digest

      t.timestamps null: false
    end
  end
end
