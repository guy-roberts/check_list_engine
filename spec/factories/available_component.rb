FactoryBot.define do

  EXAMPLES_OF_AVAILABLE_COMPONENTS = [
      {title: 'Title'},
      {title: 'Choices'},
      {title: 'Section'},
      {title: 'Photo'},
      {title: 'Date'},
      {title: 'Address'},
      {title: 'Text'},
      {title: 'Signature'},
      {title: 'Yes/No'}
  ]

  factory :available_component, :class => CheckListEngine::AvailableComponent do
    title { Faker::Lorem.word + rand(10000).to_s }
    has_photo { false }
  end
end
