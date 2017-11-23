class CreateTopicsOfInterests < ActiveRecord::Migration[5.1]
  def change
    create_table :topics_of_interests do |t|
      t.string :topic_name
      t.string :short_desc

      t.timestamps
    end
  end
end
