class CreateVotes < ActiveRecord::Migration[5.1]
  def change
    create_table :votes do |t|
      t.integer :user_id
      t.integer :photo_id
      t.integer :like

      t.timestamps
    end
  end
end
