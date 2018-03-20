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
    it 'adds a component' do
      audit_type = FactoryBot.create :audit_type, :with_components

      audit_type_component_attrs = FactoryBot.attributes_for :audit_type_component

      # TODO Shouldnt the path provice the associated audit_type ?
      audit_type_component_attrs['audit_type_id'] = audit_type.id
      # TODO This should be done in the factory, but I could not get it to add the association
      audit_type_component_attrs['available_component_id'] = CheckListEngine::AvailableComponent.first.id

      the_path = CheckListEngine::Engine.routes.url_helpers.api_audit_type_audit_type_components_url(host: 'localhost', audit_type_id: audit_type.id)

      post the_path, params:  { audit_type_component: audit_type_component_attrs }

      expect(response.status).to eq(201)
    end

    xit 'lists components in the order defined by their position' do
      audit_type = FactoryBot.create :audit_type, :with_components

      components = audit_type.audit_type_components

      path_to_get = CheckListEngine::Engine.routes.url_helpers.api_audit_types_url(host: 'localhost')

      get path_to_get,  params:  { audit_type_id: audit_type.id }

      expect(response.status).to eq(200)

      expected_order = components.order(:position).map {|c| c.id.to_s}
      actual_order = json['data'][0]['relationships']['audit_type_components']['data'].map {|c|  c['id']}

      # components.order(:position).map {|c| [c.id, c.position]  }
      # json["data"][0]["relationships"]["audit_type_components"]["data"].map {|c|  [c["id"], c["position"] ]}

      expect(actual_order).to eq(expected_order)
    end
  end


  context 'Updating a component' do
    it 'Updates the title attribute of a component' do
      audit_type = FactoryBot.create :audit_type, :with_components

      component_to_change = audit_type.audit_type_components.first

      path_to_update = CheckListEngine::Engine.routes.url_helpers.api_audit_type_audit_type_component_url(host: 'localhost',
                                                                                                          id: component_to_change.id,
                                                                                                          audit_type_id: audit_type.id)
      changed_title = 'CHANGED TITLE' + component_to_change.title

      put  path_to_update, params:  { audit_type_component: {title: changed_title, id: component_to_change.id  } }

      expect(response.status).to eq(201)
      altered_audit_type = CheckListEngine::AuditType.find audit_type.id

      expect(altered_audit_type.audit_type_components.first.title).to eq(changed_title)
    end
  end

  context 'Deletion' do
    it 'Deletes an audit type component' do
      audit_type = FactoryBot.create :audit_type, :with_components

      component_to_delete = audit_type.audit_type_components.first

      path_to_delete = CheckListEngine::Engine.routes.url_helpers.api_audit_type_audit_type_component_url(host: 'localhost',
                                                                                                      id: component_to_delete.id, audit_type_id: audit_type.id)
      delete path_to_delete

      expect(response.status).to eq(204)

    end

    xit 'will not delete a component if there are existing audits' do

    end

  end
end
