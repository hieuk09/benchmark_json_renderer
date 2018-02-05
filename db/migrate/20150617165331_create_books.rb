class CreateBooks < ActiveRecord::Migration[4.2]
  def change
    create_table :books do |t|
      t.string :name
      t.string :genre
      t.string :isbn
      t.references :author, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
