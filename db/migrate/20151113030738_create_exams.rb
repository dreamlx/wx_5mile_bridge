class CreateExams < ActiveRecord::Migration
  def change
    create_table :exams do |t|
      t.references :user, index: true, foreign_key: true
      t.string :name
      t.string :id_no
      t.string :gender
      t.string :address
      t.integer :age
      t.string :card_no
      t.string :cell
      t.string :chronic_diseases

      t.timestamps null: false
    end
  end
end
