FactoryBot.define do
  factory :user, class: User do

    _name = Faker::Name.unique.name

    sequence(:full_name) {|n| _name+"#{n}"}
    sequence(:username) {|n| _name.parameterize+"#{n}" + Time.now.to_i.to_s}
    sequence(:email) {|n| "#{n}"+Faker::Internet.email}
    sequence(:phone) {|n| Faker::PhoneNumber.cell_phone + "#{n}"}
   

  end
end