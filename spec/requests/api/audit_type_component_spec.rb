require 'rails_helper'
require 'rack/test'

describe 'Audit Type Components', type: :request do

  context 'Get a set of audit type components for an audit' do
    it 'Returns a list of audit types' do
      FactoryBot.create :audit_type, :with_components

      path_to_get = CheckListEngine::Engine.routes.url_helpers.api_audit_types_url(host: 'localhost')

      get path_to_get,  params:  { audit_type_id: CheckListEngine::AuditType.first }

      expect(response.status).to eq(200)
    end
  end

  context 'Add a component to an AuditType' do
    xit 'Add a component' do
      audit_type_attrs = FactoryBot.attributes_for :audit_type

      path_to_post = CheckListEngine::Engine.routes.url_helpers.api_audit_types_url(host: 'localhost')

      post path_to_post, params:  { audit_type: audit_type_attrs }

      expect(response.status).to eq(201)
    end

    xit 'It will not add a component that does not have a parent audit_type' do
      path_to_post = CheckListEngine::Engine.routes.url_helpers.api_audit_types_url(host: 'localhost')

      post path_to_post

      expect(response.status).to eq(400)
    end

    xit "lists components in the order defined by their position" do

    end

    xit 'It will not add a component that does not have a parent available_component' do
      path_to_post = CheckListEngine::Engine.routes.url_helpers.api_audit_types_url(host: 'localhost')

      post path_to_post

      expect(response.status).to eq(400)
    end
  end

  context 'Updating a component' do
    xit 'Updates the title attribute of a component' do
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
    xit 'Deletes an audit type' do
      new_audit_type = FactoryBot.create :audit_type
      path_to_delete = CheckListEngine::Engine.routes.url_helpers.api_audit_type_url(host: 'localhost', id: new_audit_type.id)

      delete path_to_delete

      count = CheckListEngine::AuditType.all.count new_audit_type.id

      expect(count).to eq(0)
    end

    xit 'will not delete a component if there are existing audits' do


    end
  end

end
