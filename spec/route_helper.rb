module RouteHelper
  def self.included(base)
    base.routes {CheckListEngine::Engine.routes}
  end
end