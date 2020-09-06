class CreateEstates < ActiveRecord::Migration[5.2]
  def change
    create_table :estates do |t|
      t.string   :name
      t.integer  :fee
      t.text     :adress
      t.integer  :year
      t.text     :memo
      t.timestamps
    end
  end
end
