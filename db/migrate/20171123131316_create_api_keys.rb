class CreateApiKeys < ActiveRecord::Migration[5.1]
  def change
    create_table :api_keys do |t|
      t.string :token
      t.references :user
      t.datetime :expries_at

      t.timestamps
    end
  end
end
