class AddHotelIdToBooking < ActiveRecord::Migration[6.1]
  def change
    add_column :bookings, :hotel_id, :integer
  end
end
