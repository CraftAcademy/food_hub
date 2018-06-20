FactoryBot.define do
  factory :user do |u|
    u.sequence(:email) {|u| "anders#{u}@test.com"}
    u.password '12345678'
  end
end
