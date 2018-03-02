FactoryBot.define do
  factory :audit_type, :class => CheckListEngine::AuditType do
    title { Faker::Lorem.sentence + Random.rand(100000).to_s }

    trait :with_components do
      after(:create) do |audit_type|
        create_list(:audit_type_component, 6, audit_type: audit_type)
      end
    end
  end
end
