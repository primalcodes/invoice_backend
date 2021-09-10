class CreateInvoices < ActiveRecord::Migration[6.1]
  def change
    create_table :invoices do |t|
      t.date :payment_due
      t.text :description
      t.integer :payment_terms
      t.string :client_name
      t.string :email
      t.integer :status
      t.integer :total

      t.timestamps
    end
  end
end
