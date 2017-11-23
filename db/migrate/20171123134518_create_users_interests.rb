class CreateUsersInterests < ActiveRecord::Migration[5.1]
  def change
    create_table :users_interests do |t|
      t.references :topics_of_interest
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
