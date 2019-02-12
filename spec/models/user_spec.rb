require 'spec_helper'

RSpec.describe User, type: :model do

	context 'create new' do

		it 'should be success' do
			
			joko = User.create full_name: 'Joko Susilo', email: 'joko@susilo.com', phone: '0987654321', username: 'joko'

			expect(joko.full_name).to eq 'Joko Susilo'
			expect(joko.email).to eq 'joko@susilo.com'
			expect(joko.phone).to eq '0987654321'
			expect(joko.username).to eq 'joko'
		end
	end

end