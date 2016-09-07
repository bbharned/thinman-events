class ReplaceTimeWithEventtime < ActiveRecord::Migration[5.0]
  def change
    remove_column :events, :time
    add_column :events, :eventtime, :datetime
  end
end
