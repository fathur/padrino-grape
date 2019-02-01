module Api::Versions::V1::Endpoints
  class UserEndpoint < Grape::API

    resource :users do
      get do

        data = {
            username: 'joni',
            email: 'google@joni.com',
            full_name: 'Joni',
            phone: '+83283838383'
        }

        present data, with: Api::Versions::V1::Entities::UserEntity

      end
    end
  end
end
