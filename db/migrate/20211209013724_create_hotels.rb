class CreateHotels < ActiveRecord::Migration[6.1]
  def change
    create_table :hotels do |t|
      t.string :name
      t.text :body
      t.string :image
      t.integer :prefecture_id

      t.timestamps
    end
  end
end
