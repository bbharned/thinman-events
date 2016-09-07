class ChangeTimeColumnAgainInEvents < ActiveRecord::Migration[5.0]
  def change
    change_column :events, :time, :timestamptz
  end
end
