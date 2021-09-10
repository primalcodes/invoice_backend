json.id "RT#{invoice.id}",
json.createdAt invoice.created_at.to_date
json.paymentDue invoice.payment_due
json.description invoice.description
json.paymentTerms invoice.paymentTerms
json.clientName invoice.clientName
json.clientEmail invoice.clientEmail
json.status invoice.status


json.senderAddress.do
  json.partial! 'invoices/address', obj: invoice.sender_address
end

json.clientAddress.do
json.partial! 'invoices/address', obj: invoice.client_address
end

json.partial! partial: 'invoices/items', collection: invoice.items, as: :item
json.items invoice.items do |item|
  json.name
  json.quantity
  json.price
  json.total
end

json.total