require 'rails_helper'

RSpec.describe PersonalInformationsController, type: :routing do
  describe 'Routing to ' do
    it '#new' do
      expect(get: '/users/1/personal_informations/new').to route_to(
        'personal_informations#new', user_id: '1')
    end

    it '#show' do
      expect(get: '/users/1/personal_informations/1').to route_to(
        'personal_informations#show', user_id: '1', id: '1')
    end

    it '#edit' do
      expect(get: '/users/1/personal_informations/1/edit').to route_to(
        'personal_informations#edit', user_id: '1', id: '1')
    end

    it '#create' do
      expect(post: '/users/1/personal_informations').to route_to(
        'personal_informations#create', user_id: '1')
    end

    it '#update via PUT' do
      expect(put: '/users/1/personal_informations/1').to route_to(
        'personal_informations#update', user_id: '1', id: '1')
    end

    it '#update via PATCH' do
      expect(patch: '/users/1/personal_informations/1').to route_to(
        'personal_informations#update', user_id: '1', id: '1')
    end
  end
end
