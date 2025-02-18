class CreateGroupCalendars < ActiveRecord::Migration[6.1]
  def change
    create_table :group_calendars do |t|
      t.integer :user_id
      t.integer :group_id
      t.string :title
      t.text :body
      t.datetime :start_time

      t.timestamps
    end
  end
end
