FactoryBot.define do
  factory :user do
    name { "Valid Name" }
    email { "validemail@mail.com" }
    number { "1234567890" }
    password { "password" }
    address { "This is test address" }
  end
end
