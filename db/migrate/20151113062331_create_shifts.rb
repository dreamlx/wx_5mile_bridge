class CreateShifts < ActiveRecord::Migration
  def change
    create_table :shifts do |t|
      t.references :doctor, index: true, foreign_key: true
      t.date :date
      t.time :from_time
      t.time :to_time
      t.string :category
      t.string :shift_type

      t.timestamps null: false
    end
  end
end
