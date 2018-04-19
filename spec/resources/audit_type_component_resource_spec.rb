require 'rails_helper'
require 'support/factory_bot'

RSpec.describe CheckListEngine::Api::AuditTypeComponentResource, type: :resource do
  let(:audit_type_component) {
    audit_type = FactoryBot.create :audit_type
    FactoryBot.create :audit_type_component, audit_type_id: audit_type.id
  }
  subject { described_class.new(audit_type_component, {}) }

  it { is_expected.to have_primary_key :id }
  it { is_expected.to have_attribute :title }
  it { is_expected.to have_attribute :position }
  it { is_expected.to have_attribute :help_text }
  it { is_expected.to have_attribute :has_image }
  it { is_expected.to have_attribute :choices }
  it { is_expected.to have_attribute :is_mandatory }
end
