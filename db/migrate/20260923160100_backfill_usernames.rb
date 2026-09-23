class BackfillUsernames < ActiveRecord::Migration[8.1]
  class MigrationUser < ActiveRecord::Base
    self.table_name = "users"
  end

  def up
    MigrationUser.reset_column_information

    MigrationUser.where(username: [nil, ""]).find_each do |user|
      base = user.email.to_s.split("@", 2).first.gsub(/\s+/, "")
      base = "user#{user.id}" if base.blank?
      username = base
      suffix = 2

      while MigrationUser.where("LOWER(username) = ? AND id != ?", username.downcase, user.id).exists?
        username = "#{base}#{suffix}"
        suffix += 1
      end

      user.update_columns(username: username)
    end
  end

  def down
  end
end