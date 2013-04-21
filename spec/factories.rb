FactoryGirl.define do
  factory :user do
    first_name "foo"
    last_name  "bar"
    email      { "#{first_name}@example.com" }
    password   "test"
  end

  factory :trip do
    title "Example trip"
    description  "Example trip description"
    start_date  Date.today
    end_date   Date.today + 3.days
  end

end