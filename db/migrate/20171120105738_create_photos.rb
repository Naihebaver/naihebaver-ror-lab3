class CreatePhotos < ActiveRecord::Migration[5.1]
  def change
    create_table :photos do |t|
      t.integer :user_id
      t.string :name
      t.integer :category_id

      t.timestamps
    end
  end
end
