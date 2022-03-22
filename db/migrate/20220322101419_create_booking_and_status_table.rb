class CreateBookingAndStatusTable < ActiveRecord::Migration[7.0]
  def change
    create_table :statuses do |t|
      t.string :status_value
    end
    create_table :bookings do |t|
      t.belongs_to :space
      t.belongs_to :user
      t.datetime :date
      t.belongs_to :status
    end
  end
end
