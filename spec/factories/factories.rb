require 'faker'

FactoryGirl.define do
  factory :objective do |f|
    f.title Faker::Lorem.sentence
    f.description Faker::Lorem.paragraph
    f.done false
    f.startdate Date.today
    f.duplicate false
    f.association :user
    f.association :project
  end
end

FactoryGirl.define do
  factory :project do |f|
    f.name Faker::Name.title
    f.description Faker::Lorem.paragraph
    f.association :team
  end
end

FactoryGirl.define do
  factory :team do |f|
    f.name "Toto Team"
    f.autogenerate true
  end
end

FactoryGirl.define do
  factory :user do |f|
    f.sequence(:email) { |n| "toto#{n}@tata.com" }
    f.password "tototata"
    f.password_confirmation { |u| u.password }
  end
end

FactoryGirl.define do 
	factory :profile do |f|
    f.association :user
    f.sequence(:pseudo) { |n| "toto#{n}" }
    f.firstname Faker::Name.first_name
    f.lastname Faker::Name.last_name
  end
end

FactoryGirl.define do
  factory :label do |f|
    f.name Faker::Lorem.word
    f.colour :red
  end
end

FactoryGirl.define do
  factory :teammember do |f|
    f.association :user
    f.association :team
    f.manager false
  end
end
