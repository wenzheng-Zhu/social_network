class CreateRelationships < ActiveRecord::Migration[6.1]
  def change
    create_table :relationships do |t|
      t.intger :follower_id
      t.integer :followed_id

      t.timestamps
    end
  end
end
