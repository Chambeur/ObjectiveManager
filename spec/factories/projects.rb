require 'faker'

FactoryGirl.define do
  factory :project do |f|
    f.name "Projet Toto"
    f.description "Toto Description"
    f.objectives {[Factory.create(:objective)]}
    f.team {[Factory.create(:team)]}
  end
end
