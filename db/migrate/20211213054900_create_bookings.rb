class CreateBookings < ActiveRecord::Migration[6.1]
  def change
    create_table :bookings do |t|
      t.string :name
      t.string :emailaddress
      t.date :checkin
      t.date :checkout
      t.integer :numberofpeople

      t.timestamps
    end
  end
end
