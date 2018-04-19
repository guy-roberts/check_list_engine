require 'rails_helper'
require 'support/factory_bot'

RSpec.describe CheckListEngine::Api::AvailableComponentTypeResource, type: :resource do
  let(:available_component_type) { FactoryBot.create :available_component_type }
  subject { described_class.new(available_component_type, {}) }

  it { is_expected.to have_primary_key :id }
  it { is_expected.to have_attribute :title }
  it { is_expected.to have_attribute :has_photo }
  it { is_expected.to filter(:title) }
end
