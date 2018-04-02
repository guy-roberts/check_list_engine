require 'rails_helper'
require 'rack/test'
require 'support/factory_bot'

describe 'Audit Type Components', type: :request do

  context 'Add a component to an AuditType' do
    it 'adds a component' do
      audit_type = FactoryBot.create :audit_type
      available_component = FactoryBot.create :available_component

      path_to_post = CheckListEngine::Engine.routes.url_helpers.api_audit_type_components_url(host: 'localhost')

      valid_params = {:data =>
                          {:type => "audit_type_components",
                           :attributes => {:title => "Et est omnis delectus id magni sit fugit.6676"},
                           :relationships => {
                               'audit-type' => {
                                   :data => {:type => "audit_types",
                                             :id => audit_type.id
                                   }
                               },
                               'available-component-type' => {
                                   :data => {:type => "available_component_types",
                                             :id => available_component.id
                                   }
                               }
                           }
                          }
      }

      post path_to_post, params: valid_params.to_json, headers: {'Content-Type' => 'application/vnd.api+json'}

     a = 1
    end

    it 'lists components in the order defined by their position' do
      audit_type = FactoryBot.create :audit_type, :with_components

      components = audit_type.audit_type_components

      path_to_get = CheckListEngine::Engine.routes.url_helpers.api_audit_type_audit_type_components_url(host: 'localhost', audit_type_id: audit_type.id)
      path_to_get += '?sort=position'

      get path_to_get

      expect(response.status).to eq(200)

      expected_order = components.order(:position).map {|c| c.id.to_s}
      actual_order = json['data'].map {|da| da["id"]}

      expect(actual_order).to eq(expected_order)
    end
  end


  context 'Updating a component' do
    it 'Updates the title attribute of a component' do
      audit_type = FactoryBot.create :audit_type, :with_components

      component_to_change = audit_type.audit_type_components.first

      path_to_update = CheckListEngine::Engine.routes.url_helpers.api_audit_type_component_url(host: 'localhost', id: component_to_change.id)
      changed_title = 'CHANGED TITLE' + component_to_change.title

      valid_params = {:data => {:type => "audit_type_components", :id => component_to_change.id, :attributes => {"title" => changed_title}}}

      put path_to_update, params: valid_params.to_json, headers: {'Content-Type' => 'application/vnd.api+json'}

      expect(response.status).to eq(200)

      expect(audit_type.audit_type_components.first.title).to eq(changed_title)
    end
  end

  context 'Deletion' do
    it 'Deletes an audit type component' do
      audit_type = FactoryBot.create :audit_type, :with_components

      component_to_delete = audit_type.audit_type_components.first

      path_to_delete = CheckListEngine::Engine.routes.url_helpers.api_audit_type_component_url(host: 'localhost',
                                                                                               id: component_to_delete.id)
      expect do
        delete path_to_delete
      end.to change(CheckListEngine::AuditTypeComponent, :count).by(-1)

      expect(response.status).to eq(204)
    end

    xit 'will not delete a component if there are existing audits' do

    end
  end
end
