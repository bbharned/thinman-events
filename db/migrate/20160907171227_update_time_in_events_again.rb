class UpdateTimeInEventsAgain < ActiveRecord::Migration[5.0]
  def change
    change_column :events, :time, :timestampz
  end
end
