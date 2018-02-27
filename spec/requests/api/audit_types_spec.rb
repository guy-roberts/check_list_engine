require 'rails_helper'
require 'rack/test'

describe 'Audit Type', type: :request do
  context 'Get /api/v1/audit_types' do
    it 'Returns a list of audit types' do
      path_to_get = CheckListEngine::Engine.routes.url_helpers.api_audit_types_url(host: 'localhost')

      get path_to_get

      expect(response).to be_success
    end
  end

  context 'Creating Audit Types' do
    it 'Creates an audit type' do
      audit_type_attrs = FactoryBot.attributes_for :audit_type

      path_to_post = CheckListEngine::Engine.routes.url_helpers.api_audit_types_url(host: 'localhost')

      post path_to_post, params:  { audit_type: audit_type_attrs }

      expect(response.status).to eq(201)
    end

    it 'Will not create an audit type without a title' do

      path_to_post = CheckListEngine::Engine.routes.url_helpers.api_audit_types_url(host: 'localhost')

      post path_to_post

      expect(response.status).to eq(400)
    end
  end
end
