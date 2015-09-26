class CreateSuggests < ActiveRecord::Migration
  def change
    create_table :suggests do |t|
      t.string :ISBN
      t.string :title
      t.string :description
      t.string :author
      t.string :status

      t.timestamps null: false
    end
  end
end
