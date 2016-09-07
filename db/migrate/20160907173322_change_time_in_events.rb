class ChangeTimeInEvents < ActiveRecord::Migration[5.0]
  def change
    change_column :events, :time, :timestamp 
  end
end
