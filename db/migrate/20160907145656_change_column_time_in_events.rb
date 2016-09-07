class ChangeColumnTimeInEvents < ActiveRecord::Migration[5.0]
  def change
    change_column :events, :time, :timestamp, null: true
  end
end
