require 'rails_helper'
require 'rack/test'
require 'support/api_spec_helper'
require 'support/factory_bot'

RSpec.describe 'Available Types', type: :request do

  include APISpecHelper

  context 'Get /api/v1/available_component_types' do
    it 'Returns a list of available component types' do

      NUMBER_TO_CREATE = 5

      FactoryBot.create_list :available_component_type, NUMBER_TO_CREATE

      path_to_get = CheckListEngine::Engine.routes.url_helpers.api_available_component_types_url(host: 'localhost')

      get path_to_get

      expect(response).to be_success
      expect(response.body).to look_like_json

      expect(json['data'].count).to eq(NUMBER_TO_CREATE)

      NUMBER_TO_CREATE.times do |i|
        title = json['data'][i]

        CheckListEngine::AvailableComponentType.find_by_title title['attributes']['title']
      end

    end

  end

end
