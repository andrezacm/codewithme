class LanguagesUsers < ActiveRecord::Base
  belongs_to :user
  belongs_to :language

  def update_learn_or_teach type
    self[type] = true
    self.save!
  end
end
