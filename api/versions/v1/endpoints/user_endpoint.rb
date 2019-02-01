module Api::Versions::V1::Endpoints
  class UserEndpoint < Grape::API

    resource :users do
      get do

        data = User.all

        present data, with: Api::Versions::V1::Entities::UserEntity

      end
    end
  end
end
