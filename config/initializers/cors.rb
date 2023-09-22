Rails.application.config.middleware.insert_before 0, Rack::Cors do
    allow do
      origins '*' # Update with the appropriate origins that are allowed to access your API
      resource '*',
        headers: :any,
        methods: [:get, :post, :put, :patch, :delete, :options, :head],
        expose: ['access-token', 'expiry', 'token-type', 'uid', 'client'] # Add the necessary headers for your authentication mechanism
    end
  end