class UserController < ApplicationController

  helper_method :recommend_best_users, :recommend_users

  def recommend
  end

  def recommend_users
    users = recommend_users_to_learn
    #users << recommend_users_to_teach
    #users.order("RANDOM()")
  end

  def recommend_best_users
    languages = current_user.languages
    association = []
    languages.each { |l| association << l.languages_user.where(:learn => 'true', :teach => 'true') }
    association.each { |a| a.user } || []
  end

  def recommend_users_to_learn
    #languages = current_user.languages
 
    arr = User.all
    arr.delete(current_user)
    arr
    #opa = []
    #current_user.languages_user.each { |l| opa << l.user }
    #opa
    #opa = association[0].user.email
  end
  
  def recommend_users_to_teach
    languages = current_user.languages
    association = [] 
    languages.each { |l| association << l.languages_user.where(:teach => 'true', :teach => 'nil') }
    #association.each { |a| a }
  end

  def add_language_to_learn
    add_new_language params['language'], 'learn'
  end

  def add_language_to_teach
    add_new_language params['language'], 'teach'
  end

  private
  def add_new_language lang, type
    language = (Language.where :name => lang).first
p
    #language = (Language.all).first
    current_user.add_language language
    
    association = (LanguagesUser.where :user => current_user, :language => language).first

    association.update_learn_or_teach type
  end

  def user_params
    params.require(:user).permit(:language)
  end
end
