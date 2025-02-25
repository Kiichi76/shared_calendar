class CreateGroupCalendars < ActiveRecord::Migration[6.1]
  def change
    create_table :group_calendars do |t|
      t.integer :user_id, null: false
      t.integer :group_id, null: false
      t.string :title, null: false
      t.text :body
      t.datetime :start_time

      t.timestamps
    end
  end
end
