class CreateAppointments < ActiveRecord::Migration
  def change
    create_table :appointments do |t|
      t.references :user, index: true, foreign_key: true
      t.references :doctor, index: true, foreign_key: true
      t.datetime :booking_time
      t.string :cell
      t.string :state

      t.timestamps null: false
    end
  end
end
