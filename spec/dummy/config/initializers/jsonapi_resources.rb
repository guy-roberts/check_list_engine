# config/initializers/jsonapi_resources.rb
JSONAPI.configure do |config|
  config.default_paginator = :paged

  config.top_level_links_include_pagination = true

  config.default_page_size = 10
  config.maximum_page_size = 20
end
