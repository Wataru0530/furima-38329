class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string      :item_name,    null: false 
      t.text        :info,         null: false
      t.integer     :category_id,  null: false
      t.integer     :situation_id, null: false 
      t.integer     :cost_id,      null: false
      t.integer     :area_id,      null: false
      t.integer     :day_id,       null: false
      t.integer     :price,        null: false
      t.references  :user,         null: false, foreign_key: true
      t.timestamps
    end
  end
end
