class AvailableComponentSerializer
  include FastJsonapi::ObjectSerializer

  set_type :available_component
  attributes :title
  attributes :has_photo
end

