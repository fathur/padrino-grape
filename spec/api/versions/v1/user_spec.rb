require 'spec_helper'

context ::Api::Versions::V1::Endpoints::UserEndpoint do

  include Rack::Test::Methods

  def app
    Api::Versions::V1::Endpoints::UserEndpoint
  end

  let(:users_url) {'/users'}

  let!(:users) {create_list :user, 100}
  
  describe 'GET /users' do
    
    it 'should return success' do

      get users_url


      response = JSON.parse(last_response.body)
     
      response.each do |user|
        expect(user['username']).to be_a String
      end
    end
  end

end