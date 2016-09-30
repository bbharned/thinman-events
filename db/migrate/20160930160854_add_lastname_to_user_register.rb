class AddLastnameToUserRegister < ActiveRecord::Migration[5.0]
  def change
    add_column :user_registers, :lastname, :string
  end
end
