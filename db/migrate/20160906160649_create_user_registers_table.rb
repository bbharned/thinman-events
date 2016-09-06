class CreateUserRegistersTable < ActiveRecord::Migration[5.0]
  def change
    create_table :user_registers do |t|
        t.integer :user_id
        t.integer :event_id
    end
  end
end
