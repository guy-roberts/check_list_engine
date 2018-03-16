#https://stackoverflow.com/questions/43429463/how-to-test-controller-post-create-of-json-api-on-rails-using-rspec

module APISpecHelper
  def to_json_api(model)
    {
        data: {
            type: ActiveModel::Naming.plural(model),
            attributes: model.attributes
        }.tap do |hash|
          hash[:id] = model.id if model.persisted?
        end
    }
  end
end
