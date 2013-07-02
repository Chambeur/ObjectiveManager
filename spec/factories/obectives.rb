require 'faker'

FactoryGirl.define do
  factory :objective do |f|
    f.title "Toto"
    f.description "Toto Description"
    f.done false
    f.startdate Date.today
    f.user {[Factory.create(:user)]}
    f.project {[Factory.create(:project)]}
  end
end
