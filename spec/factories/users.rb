require 'faker'

FactoryGirl.define do
  factory :user do |f|
    f.email "toto@toto.com"
  end
end
