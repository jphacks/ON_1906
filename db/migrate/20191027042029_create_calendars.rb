class CreateCalendars < ActiveRecord::Migration[6.0]
  def change
    create_table :calendars do |t|
      t.references :user, foreign_key: true
      t.string :summary
      t.date :start
      t.date :end

      t.timestamps
    end
  end
end
