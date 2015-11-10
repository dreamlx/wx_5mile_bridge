class CreateConsults < ActiveRecord::Migration
  def change
    create_table :consults do |t|
      t.references :user, index: true, foreign_key: true
      t.string :title
      t.string :department
      t.text :content
      t.datetime :submit_at
      t.string :state

      t.timestamps null: false
    end
  end
end
