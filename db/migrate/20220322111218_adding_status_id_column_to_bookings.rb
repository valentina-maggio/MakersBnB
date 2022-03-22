class AddingStatusIdColumnToBookings < ActiveRecord::Migration[7.0]
  def change
    add_column :bookings, :status_id, :integer
  end
end
