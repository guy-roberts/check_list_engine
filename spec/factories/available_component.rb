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
    title {
      index =(rand EXAMPLES_OF_AVAILABLE_COMPONENTS.count - 1)
      EXAMPLES_OF_AVAILABLE_COMPONENTS[index][:title]
    }
    has_photo { false }
  end
end
