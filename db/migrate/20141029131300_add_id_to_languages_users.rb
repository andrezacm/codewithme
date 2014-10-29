class AddIdToLanguagesUsers < ActiveRecord::Migration
  def change
    add_column :languages_users, :id, :primary_key
  end
end
