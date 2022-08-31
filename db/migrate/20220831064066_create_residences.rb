class CreateResidences < ActiveRecord::Migration[6.0]
  def change
    create_table :residences do |t|
      t.string              :code,      null: false
      t.integer             :area_id,   null: false
      t.string              :city,      null: false
      t.string              :address,   null: false
      t.string              :buiding
      t.string              :phone,     null: false
      t.references          :information,  null: false,foreign_key: true
      t.timestamps
    end
  end
end
