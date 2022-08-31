class CreateInformation < ActiveRecord::Migration[6.0]
  def change
    create_table :information do |t|
      t.integer        :card,     null: false
      t.integer        :deadline, null: false
      t.integer        :security, null: false
      t.timestamps
    end
  end
end
