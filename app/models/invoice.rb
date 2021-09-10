class Invoice < ApplicationRecord
  has_many :items
  has_one :sender_address, as: addressable
  has_one :client_address, as: addressable
end
