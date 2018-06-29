FactoryBot.define do
  factory :user do |u|
    u.sequence(:email) {|u| "anders#{u}@test.com"}
    u.password '12345678'
    u.sequence(:full_name) {|u| "Maran#{u} Maransdottir"}
  end
end
