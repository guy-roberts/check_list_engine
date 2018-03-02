module CheckListEngine

  # This class provides hints to the UI about how to render the different
  # kinds of component, select boxes, photo upload, text boxes ...
  class AvailableComponent < ApplicationRecord
    has_many :audit_type_components
  end
end
