class CreateJoinTableUsersLanguages < ActiveRecord::Migration
  def change
    create_join_table :users, :languages, column_options: {null: true} do |t|
      t.index [:user_id, :language_id]
      t.index [:language_id, :user_id]
    end
  end
end
