require 'rails_helper'
require 'rack/test'
require 'support/api_spec_helper'
require 'support/factory_bot'

RSpec.describe 'Audit Type', type: :request do

  include APISpecHelper

  context 'Get /api/v1/audit_types' do
    it 'Returns a list of audit types' do

      NUMBER_TO_CREATE = 5

      FactoryBot.create_list :audit_type, NUMBER_TO_CREATE, :with_components

      path_to_get = CheckListEngine::Engine.routes.url_helpers.api_audit_types_url(host: 'localhost')

      get path_to_get

      expect(response).to be_success
      expect(response.body).to look_like_json

      expect(json['data'].count).to eq(NUMBER_TO_CREATE)

      NUMBER_TO_CREATE.times do |i|
        title = json['data'][i]

        CheckListEngine::AuditType.find_by_title title['attributes']['title']
      end

    end

    xit 'Returns a paginated list of audit types' do
      FactoryBot.create_list :audit_type, 100

      path_to_get = CheckListEngine::Engine.routes.url_helpers.api_audit_types_url(host: 'localhost')

      get path_to_get

      # 25 is the default page size
      expect(json['data'].count).to eq(25)
    end

    xit 'fetches an audit_type with its audit_type_components' do
      audit_type = FactoryBot.create :audit_type, :with_components

      path_to_get = CheckListEngine::Engine.routes.url_helpers.api_audit_type_url(host: 'localhost', id: audit_type.id)
      #path_to_get += '?include=audit-type-components'

      get path_to_get

      expect(response.status).to eq(200)

      # TODO This feels like a mess.  4 is the number of audit_type_components that the factory makes
      expect(json['data']['relationships']['audit-type-components']['data'].count).to eq(4)
    end
  end

  context 'POST :create' do

    it 'Creates an audit type from valid parameters' do

      path_to_post = CheckListEngine::Engine.routes.url_helpers.api_audit_types_url(host: 'localhost')

      #valid_params = to_json_api(FactoryBot.build(:audit_type))
      valid_params = {:data=>{:type=>"audit_types", :attributes=>{"title"=>"Et est omnis delectus id magni sit fugit.6676"}}}

      expect do
        post path_to_post, params: valid_params
      end.to change(CheckListEngine::AuditType, :count).by(+1)

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

      valid_params = {:data=>{:type=>"audit_types", "id" => new_audit_type.id, :attributes=>{ "title"=>new_title }}}

      patch  path_to_update, params:  valid_params

      expect(response.status).to eq(200)
      altered_audit_type = CheckListEngine::AuditType.find new_audit_type.id

      expect(altered_audit_type.title).to eq(new_title)
    end
  end

  context 'Delete an audit type' do
    it 'Deletes an audit type' do
      new_audit_type = FactoryBot.create :audit_type
      path_to_delete = CheckListEngine::Engine.routes.url_helpers.api_audit_type_url(host: 'localhost', id: new_audit_type.id)

      delete path_to_delete

      count = CheckListEngine::AuditType.all.count new_audit_type.id

      expect(count).to eq(0)
    end
  end
end
