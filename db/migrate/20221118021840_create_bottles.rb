class CreateBottles < ActiveRecord::Migration[6.1]
  def change
    create_table :bottles do |t|
      t.string :title
      t.string :wine_type
      t.string :grape_variety
      t.integer :vintage
      t.integer :user_id
      t.integer :winery_id

      t.timestamps
    end
  end
end
