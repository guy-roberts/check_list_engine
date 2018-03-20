module RouteHelper
  def self.included(base)
    base.routes {Engine.routes}
  end
end
