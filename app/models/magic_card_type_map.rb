class MagicCardTypeMap < ActiveRecord::Base
  belongs_to :magic_card_name
  belongs_to :magic_card_type
end
