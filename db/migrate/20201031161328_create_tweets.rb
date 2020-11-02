class CreateTweets < ActiveRecord::Migration[6.0]
  def change
    create_table :tweets do |t|
      t.string :title
      t.text :content
      t.boolean :status
      t.integer :user_id
      t.string :slug

      t.timestamps
    end
    add_index :tweets, :slug, unique: true
  end
end
