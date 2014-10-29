class UserController < ApplicationController

  def recommended_users
        
  end

  def add_languages_to_learn
    add_new_language params['language'], 'learn'
  end

  def add_languages_to_teach
    add_new_language params['language'], 'teach'
  end

  private
  def add_new_language lang, type
    language = (Language.find_by :name => lang).first

    current_user.add_language language
    
    association = LanguagesUsers.find_by :user => current_user, :language => language
  
    association.update_learn_teach type  
  end

end
