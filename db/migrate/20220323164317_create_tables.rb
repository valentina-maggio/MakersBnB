class CreateTables < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :password_digest
    end
    create_table :spaces do |t|
      t.string :name
      t.string :description
      t.integer :price
      t.string :picture
      t.datetime :available_from
      t.datetime :available_to
    end
    create_table :bookings do |t|
      t.datetime :date
    end
    create_table :statuses do |t|
      t.string :status
    end
  end
end
