class AddPasswordToAdministrators < ActiveRecord::Migration
  def change
    add_column :administrators, :password, :string
  end
end
