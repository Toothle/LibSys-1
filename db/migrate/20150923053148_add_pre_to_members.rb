class AddPreToMembers < ActiveRecord::Migration
  def change
    add_column :members, :pre, :boolean, default: false
  end
end
