FactoryGirl.define do
  factory :client do
    sequence(:email) { |n| "client+#{n}@artflowme.com" }
    password 'testtest'
  end

  factory :designer do
    sequence(:email) { |n| "designer#{n}@artflowme.com" }
    password 'testtest'
  end

  factory :project do
    sequence(:name) { |n| "Project #{n}" }
    association :campaign
    active true
  end

  factory :campaign do
    sequence(:name) { |n| "Campaign #{n}" }
    association(:client)
  end

  factory :creation do |x|
    sequence(:name) { |n| "Creation #{n}" }
    association(:project)
    association(:designer)
    stage 'initial'
    revision 1
    description "This is a description"
  end

  factory :admin do |x|
    sequence(:email) { |n| "admin#{n}@artflowme.com" }
    password 'testtest'
  end
end
