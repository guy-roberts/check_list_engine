require 'rails_helper'
require 'support/factory_bot'

RSpec.describe CheckListEngine::Api::AuditTypeResource, type: :resource do
  let(:audit_type) { FactoryBot.create :audit_type }
  subject { described_class.new(audit_type, {}) }

  it { is_expected.to have_primary_key :id }
  it { is_expected.to have_attribute :title }
  it { is_expected.to filter(:title) }

end
