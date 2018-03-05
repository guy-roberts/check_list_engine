FactoryBot.define do
  factory :audit_type_component, :class => CheckListEngine::AuditTypeComponent do
    title { Faker::Lorem.sentence + Random.rand(100000).to_s }
    help_text { Faker::Lorem.sentence }
    position { rand 20 }
    association  :available_component, factory: :available_component
  end
end
