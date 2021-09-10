class CreateAddresses < ActiveRecord::Migration[6.1]
  def change
    create_table :addresses do |t|
      t.references :addressable, polymorphic: true, null: false
      t.string :street
      t.string :city
      t.string :post_code
      t.string :country

      t.timestamps
    end
  end
end
