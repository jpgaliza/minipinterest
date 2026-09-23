class MakeUsernameIndexCaseInsensitive < ActiveRecord::Migration[8.1]
  def change
    remove_index :users, :username
    add_index :users, "LOWER(username)", unique: true, name: "index_users_on_lower_username"
  end
end