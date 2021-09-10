class CreateInvoices < ActiveRecord::Migration[6.1]
  def change
    create_table :invoices do |t|
      t.date :payment_due
      t.text :description
      t.integer :payment_terms
      t.string :client_name
      t.string :email
      t.integer :status, default: 0, null: false
      t.integer :total, default: 0, null: false

      t.timestamps
    end
  end
end
