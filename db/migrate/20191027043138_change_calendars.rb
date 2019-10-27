class ChangeCalendars < ActiveRecord::Migration[6.0]
  def change
    change_column :calendars, :start, :datetime
    change_column :calendars, :end, :datetime
  end
end
