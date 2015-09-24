class CreateHistories < ActiveRecord::Migration
  def change
    create_table :histories do |t|
      t.references :member, index: true, foreign_key: true
      t.references :book, index: true, foreign_key: true
      t.string :action

      t.timestamps null: false
    end
    add_index :histories, [:member_id, :book_id, :created_at]
  end
end
