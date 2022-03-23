class AddReferences < ActiveRecord::Migration[7.0]
  def change
    add_reference :spaces, :user, foreign_key: true
    add_reference :bookings, :space, foreign_key: true
    add_reference :bookings, :user, foreign_key: true
    add_reference :bookings, :status, foreign_key: true
  end
end
