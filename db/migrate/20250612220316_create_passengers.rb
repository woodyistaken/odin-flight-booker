class CreatePassengers < ActiveRecord::Migration[8.0]
  def change
    create_table :passengers do |t|
      t.string :email
      t.string :name
      t.belongs_to :booking
      t.timestamps
    end
  end
end
