class CreateBenches < ActiveRecord::Migration[5.2]

  def change
    create_table :benches do |t|
      t.string :name
      t.string :vin
      t.string :platform
    end
  end

end
