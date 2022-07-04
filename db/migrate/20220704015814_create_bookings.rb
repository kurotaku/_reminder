class CreateBookings < ActiveRecord::Migration[7.0]
  def change
    create_table :bookings do |t|
      t.references :user, null: false, foreign_key: true
      t.references :holder, null: false, foreign_key: { to_table: :users }
      t.datetime :start_at

      t.timestamps
    end
  end
end
