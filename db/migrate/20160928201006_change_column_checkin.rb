class ChangeColumnCheckin < ActiveRecord::Migration[5.0]
  def change
    remove_column :user_registers, :checkedin, :boolean
    add_column :user_registers, :checkedin, :boolean, default: false
  end
end
