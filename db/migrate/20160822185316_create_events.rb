class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
        t.string :title
        t.text :description
        t.date :date
        t.time :time
        t.integer :cost
        t.timestamps
    end
  end
end
