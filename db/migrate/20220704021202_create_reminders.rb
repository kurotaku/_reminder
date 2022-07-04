class CreateReminders < ActiveRecord::Migration[7.0]
  def change
    create_table :reminders do |t|
      t.references :user, null: false, foreign_key: true
      t.references :receiver, null: false, foreign_key: { to_table: :users }
      t.references :booking, null: false, foreign_key: true
      t.integer :send_status, default: 0, null: false
      t.datetime :scheduled_at
      t.datetime :send_at
      t.text :content

      t.timestamps
    end
  end
end
