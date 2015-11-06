class CreateHospitals < ActiveRecord::Migration
  def change
    create_table :hospitals do |t|
      t.string :title
      t.string :img
      t.text :content
      t.string :video_url
      t.string :state

      t.timestamps null: false
    end
  end
end
