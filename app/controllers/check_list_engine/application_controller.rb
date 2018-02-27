module CheckListEngine
  class ApplicationController < ActionController::Base
    # This is an API, so is stateless.  Token Authentication will be used.
    #protect_from_forgery with: :exception
  end
end
