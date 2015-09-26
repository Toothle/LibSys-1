class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :ISBN
      t.string :title
      t.string :description
      t.string :author
      t.string :status

      t.timestamps null: false
    end
  end
end
