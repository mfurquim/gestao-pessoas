class SearchesController < ApplicationController
  def index
    @results = PersonalInformation.all
    search = params[:search]
    if search
      @results = find_user(search)
    else
      @results = {}
    end
  end

  def find_user(keyword)
    personal_information = search_user(PersonalInformation, :personal_information_id, keyword)
    subject = search_user(Subject, :subject_id, keyword)
    user = { information: personal_information, subject: subject }
    return user
  end

  def search_user(class_entity, name_field, keyword)
    user = class_entity.select(:name, :id).where('name LIKE ?', "%#{keyword}%")
  end

end
