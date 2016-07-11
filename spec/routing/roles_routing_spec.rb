require 'rails_helper'

RSpec.describe RolesController, type: :routing do
  describe 'Routing to ' do
    it '#index' do
      expect(get: '/roles').to route_to('roles#index')
    end

    it '#edit' do
      expect(get: '/users/1/edit_role').to route_to('roles#edit', user_id: '1')
    end

    it '#update via POST' do
      expect(post: '/users/1/edit_role').to route_to(
        'roles#update', user_id: '1')
    end
  end
end
