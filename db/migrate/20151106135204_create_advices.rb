class CreateAdvices < ActiveRecord::Migration
  def change
    create_table :advices do |t|
      t.string :title
      t.string :img
      t.text :content
      t.string :video_url
      t.string :advice_type
      t.string :state

      t.timestamps null: false
    end
  end
end
