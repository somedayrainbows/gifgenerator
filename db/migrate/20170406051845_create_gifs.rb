class CreateGifs < ActiveRecord::Migration[5.0]
  def change
    create_table :gifs do |t|
      t.string :image_path

      t.timestamps null: false
    end
  end
end
