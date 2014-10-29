class LanguagesUser < ActiveRecord::Base
  belongs_to :user
  belongs_to :language

  self.table_name = 'languages_users'

  def update_learn_or_teach type
    self[type] = true
    self.save!
  end
end
