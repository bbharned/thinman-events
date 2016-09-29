class AddClockinToUserRegiaters < ActiveRecord::Migration[5.0]
  def change
    add_column :user_registers, :checkedin, :boolean, default: false
  end
end
