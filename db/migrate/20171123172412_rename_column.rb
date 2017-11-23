class RenameColumn < ActiveRecord::Migration[5.1]
  def change
    rename_column :api_keys, :expries_at, :expires_at
  end
end
