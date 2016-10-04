class SearchesController < ApplicationController
  before_filter :authenticate_user!

  def index
    @results = {}
    search = params[:search]
    if search
      @results = find_user_all(search)
    end
    authorize Searches
  end

  def find_user_all(keyword)
    personal_information = search_user(PersonalInformation, :personal_information_id, keyword)
    subject = search_user(Subject, :subject_id, keyword)
    user_personal_information = find_user(personal_information)
    user_subject = find_user(subject)
    user = { information: user_personal_information, subject: user_subject }
    return user
  end

  def find_user(entities)
    users = []
    entities.each do |entity|
      users << User.where(id: entity.user_id)
    end
    return users
  end

  def search_user(class_entity, name_field, keyword)
    user = class_entity.select(:name, :id, :user_id).where('name LIKE ?', "%#{keyword}%")
  end

end
