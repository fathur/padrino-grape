module Api::Versions::V1::Endpoints
  class UserEndpoint < Grape::API

    resource :users do
      get do
        { ping: 'pong' }
      end
    end
  end
end
