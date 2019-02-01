module Api::Versions::V1::Entities
  class UserEntity < Grape::Entity
    expose :username, :phone, :email, :full_name
  end
end
