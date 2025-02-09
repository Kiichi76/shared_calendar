class CreatePersonalCalendars < ActiveRecord::Migration[6.1]
  def change
    create_table :personal_calendars do |t|
      t.integer :user_id 
      t.string :title, null: false
      t.text :body
      t.datetime :start_time
      
      t.timestamps
    end
  end
end
