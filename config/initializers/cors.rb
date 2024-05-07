# config/initializers/cors.rb
Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins '*'  # Allows all origins
    resource '*',  # Allows all resources
      headers: :any,
      methods: [:get, :post, :patch, :put, :delete, :options, :head]  # Allows all methods
  end
end
