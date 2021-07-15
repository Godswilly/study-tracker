FactoryBot.define do
  factory :study do
    association(:user)
    hours { 5 }
    goal { 5 }
    sequence(:name) { |i| "Study #{i}" }
  end
end
