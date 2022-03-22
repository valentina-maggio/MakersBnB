class CreateSpaces < ActiveRecord::Migration[7.0]
  def change
    create_table :spaces do |t|
      t.belongs_to :user
      t.string :name
      t.string :description
      t.integer :price
      t.string :picture
      t.datetime :available_from
      t.datetime :available_to
    end
  end
end
