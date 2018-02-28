require 'rails_helper'
require 'rack/test'

describe 'Audit Type', type: :request do

  context 'Get /api/v1/audit_types' do
    it 'Returns a list of audit types' do
      path_to_get = CheckListEngine::Engine.routes.url_helpers.api_audit_types_url(host: 'localhost')

      get path_to_get

      expect(response).to be_success
    end

    it 'Returns a paginated list of audit types' do
      FactoryBot.create_list :audit_type, 200

      path_to_get = CheckListEngine::Engine.routes.url_helpers.api_audit_types_url(host: 'localhost')

      get path_to_get

      audit_types = JSON.parse(response.body)

      # 25 is the default page size
      expect(audit_types.count).to eq(25)
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

  context 'Updating an audit type' do
    it 'Updates the title attribute of an audit type' do
      new_audit_type = FactoryBot.create :audit_type
      path_to_update = CheckListEngine::Engine.routes.url_helpers.api_audit_type_url(host: 'localhost', id: new_audit_type.id)
      new_title = 'Some new title'

      patch  path_to_update, params:  { audit_type: {title: new_title} }

      expect(response.status).to eq(200)
      altered_audit_type = CheckListEngine::AuditType.find new_audit_type.id

      expect(altered_audit_type.title).to eq(new_title)
    end
  end

  context "Delete an audit type" do
    it 'Deletes an audit type' do
      new_audit_type = FactoryBot.create :audit_type
      path_to_delete = CheckListEngine::Engine.routes.url_helpers.api_audit_type_url(host: 'localhost', id: new_audit_type.id)

      delete path_to_delete

      count = CheckListEngine::AuditType.all.count new_audit_type.id

      expect(count).to eq(0)
    end
  end
end
