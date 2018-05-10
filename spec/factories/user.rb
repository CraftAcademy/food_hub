FactoryBot.define do
  factory :user do
    password '12345678'
    email { "maran@test.com".gsub(/\s/,'.').downcase }
  end
end