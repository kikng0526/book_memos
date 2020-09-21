class CreateLikes < ActiveRecord::Migration[6.0]
  def change
    create_table :likes do |t|
      t.references :user, foreign_key: true
      t.references :comment, foreign_key: true
      t.boolean :liked
      t.timestamps
    end
  end
end
