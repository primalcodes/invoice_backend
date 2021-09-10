class Invoice < ApplicationRecord
  enum status: { pending: 0, paid: 1 }

  has_many :items
  has_one :sender_address, as: addressable
  has_one :client_address, as: addressable

  accepts_nested_attributes_for :sender_address, :client_address
end
