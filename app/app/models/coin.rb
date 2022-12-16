class Coin < ApplicationRecord
  belongs_to :mining_type
  belongs_to :user
end
