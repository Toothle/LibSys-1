class AddIndexToBooksIsbn < ActiveRecord::Migration
  def change
    add_index :books, :ISBN, unique: true
  end
end
