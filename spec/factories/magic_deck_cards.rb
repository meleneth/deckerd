# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :magic_deck_card do
    magic_deck nil
    magic_card_name nil
    maindeck 1
    sideboard 1
  end
end
