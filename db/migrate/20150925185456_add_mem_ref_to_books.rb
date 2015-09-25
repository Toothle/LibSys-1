class AddMemRefToBooks < ActiveRecord::Migration
  def change
    add_reference :books, :member, index: true, foreign_key: true
  end
end
