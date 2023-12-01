FactoryBot.define do
  factory :synonym do
    word { nil }
    synonym { "MyString" }
    authorization_status { 1 }
  end
end
