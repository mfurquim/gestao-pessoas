class SearchesController < ApplicationController
  def index
  end

  def search_entities(entity_class, keyword)
     entities = class_entity.select(:name, :id).where('name LIKE ?', "%#{keyword}%")
  end
end
