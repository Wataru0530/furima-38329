class AddLastnamekanaToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :Lastnamekana, :string
  end
end
