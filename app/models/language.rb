class Language < ActiveRecord::Base
  has_and_belongs_to_many :users, join_table: :languages_users
  has_many :languages_user, :class_name => 'LanguagesUser'
end
