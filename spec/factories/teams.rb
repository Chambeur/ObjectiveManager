require 'faker'

FactoryGirl.define do
  factory :team do |f|
    f.name "Toto Team"
    f.autogenerate true
  end
end
