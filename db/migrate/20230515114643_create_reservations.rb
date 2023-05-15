class CreateReservations < ActiveRecord::Migration[7.0]
  def change
    create_table :reservations do |t|
      t.date :start_date
      t.date :end_date
      t.references :car, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.integer :price_per_day

      t.timestamps
    end
  end
end