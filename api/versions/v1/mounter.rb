module Api
  module Versions
    module V1
      class Mounter < Grape::API
        mount Api::Versions::V1::Endpoints::UserEndpoint
      end
    end
  end
end