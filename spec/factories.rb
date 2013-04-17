FactoryGirl.define do
  factory :user do
    first_name "foo"
    last_name  "bar"
    email      { "#{first_name}@example.com" }
    password   "test"
  end
end