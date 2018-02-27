FactoryBot.define do
  factory :audit_type, :class => CheckListEngine::AuditType do
    title { Faker::Lorem.sentence + Random.rand(100000).to_s }
  end
end
